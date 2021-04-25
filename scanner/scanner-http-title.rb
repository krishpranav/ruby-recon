#!/usr/bin/env ruby
# -*- coding: utf-8

#requires
require 'nmap/program'

targets = ARGV[0]
time = Time.new
t = time.strftime("%Y-%m-%d-%H:%M:%S")
report = '../reports/nmapscan_' + t.to_s + '_http-title' + '.xml'
puts "report name: #{report}"
ports = 80,443,8080 #add port here. Use array when setting multiple ports

Nmap::Program.scan do |nmap|
  nmap.target_file = targets
  nmap.ports = ports
  nmap.connect_scan = true
  nmap.service_scan = true
  nmap.disable_dns = true
  nmap.aggressive_timing = true
  nmap.verbose = true
  nmap.script = 'http-title'
  nmap.xml = report
end