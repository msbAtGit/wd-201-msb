def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

#Converting all the records into map for easier lookup
def parse_dns(dns_raw)
  dns_records_map = {}
  dns_raw.each do |dns_rec|
    dns_rec_fields = dns_rec.split(",")
    record_map = {}
    if (dns_rec_fields[0] == "A")
      record_map[:type] = "A"
      record_map[:value] = dns_rec_fields[2].strip
      dns_records_map[dns_rec_fields[1].strip] = record_map
    elsif (dns_rec_fields[0] == "CNAME")
      record_map[:type] = "CNAME"
      record_map[:value] = dns_rec_fields[2].strip
      dns_records_map[dns_rec_fields[1].strip] = record_map
    end
  end
  return dns_records_map
end

def resolve(dns_records, lookup_chain, domain)
  dns_record = dns_records[domain]

  if (dns_record == nil)
    lookup_chain.push("NOT FOUND")
  elsif (dns_record[:type] == "A")
    lookup_chain.push(dns_record[:value])
  else
    lookup_chain.push(dns_record[:value])
    resolve(dns_records, lookup_chain, dns_record[:value])
  end
  lookup_chain
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
# puts(dns_records) debugging code to check CNAME record
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
if (lookup_chain[1] == "NOT FOUND")
  puts("Error: record not found for #{domain}")
else
  puts lookup_chain.join(" => ")
end
