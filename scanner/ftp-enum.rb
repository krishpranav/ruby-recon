#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# requires
require 'nmap/program'

targets = ARGV[0]
time = Time.new
t = time.strftime("%Y-%m-%d-%H:%M:%S")
report = '../reports/nmapscan_' + t.to_s + '_ftp-enum' + '.xml'
puts "report nmae: #{report}"
ports = 21 

Nmap::Program.scan do |nmap|
    nmap.target_file = target
    nmap.ports = ports
    nmap.connect_scan = true
    nmap.service_scan = true
    nmap.disable_dns = true
    nmap.aggressive_timing = true
    nmap.verbose = true
    nmap.script = 'ftp-anon,ftp-brute'
    nmap.xml = report
end
