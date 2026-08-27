#!/usr/bin/env ruby
# frozen_string_literal: true

require 'erb'
require 'fileutils'
require 'yaml'

ROOT = File.expand_path(__dir__)
SOURCE = File.join(ROOT, 'src')
OUTPUT = File.join(ROOT, 'public')
ASSETS = File.join(ROOT, 'assets')

data = YAML.load_file(File.join(SOURCE, 'data.yml'))
template = ERB.new(File.read(File.join(SOURCE, 'template.html.erb')))
blog_template = ERB.new(File.read(File.join(SOURCE, 'blog.html.erb')))

FileUtils.rm_rf(OUTPUT)
FileUtils.mkdir_p(OUTPUT)
File.write(File.join(OUTPUT, 'index.html'), template.result_with_hash(site: data))
FileUtils.cp(File.join(SOURCE, 'style.css'), File.join(OUTPUT, 'style.css'))
FileUtils.mkdir_p(File.join(OUTPUT, 'assets'))
FileUtils.cp_r(Dir[File.join(ASSETS, '*')], File.join(OUTPUT, 'assets')) if Dir.exist?(ASSETS)

(data['blogs'] || []).each do |blog|
	blog_output = File.join(OUTPUT, 'blogs', blog['slug'])
	FileUtils.mkdir_p(blog_output)
	File.write(File.join(blog_output, 'index.html'), blog_template.result_with_hash(site: data, blog: blog))
end

puts "Built #{File.join(OUTPUT, 'index.html')} and #{data['blogs']&.length || 0} blog page(s)"
