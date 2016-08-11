#!/usr/bin/env ruby

data = Hash.new
`pc_query -m ""`.each_line do |l|
  address, name = l.split("\t")
  unless name.nil? || address.nil?
    i = 0
    sname = name.gsub(/\s/, '_').downcase
    while(data.keys.include?(nick = sname + "_#{i}")) do
      i += 1
    end

    data[nick] = %Q{"#{name}"\t<#{address}>}
  end
end

data.each { |k, v| puts ['alias', k, v].join("\t") }
