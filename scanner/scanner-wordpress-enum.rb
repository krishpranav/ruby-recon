#!/usr/bin/env ruby
# -*- coding: utf-8

#requires
require 'nmap/program'

targets = ARGV[0]
time = Time.new
t = time.strftime("%Y-%m-%d-%H:%M:%S")
report = '../reports/nmapscan_' + t.to_s + '_wordpress-enum' + '.xml'
puts "report name: #{report}"
ports = 80,443,8080 

Nmap::program.scan do |nmap|
    nmap.target_file = targets
    nmap.ports = ports
    nmap.connect_scan = true
    nmap.service_scan = true
    nmap.disable_dns = false
    nmap.aggressive_timing = true 
    nmap.verbose = true
    nmap.script = 'http-wordpress-enum'
    nmap.xml = report
end
