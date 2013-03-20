# encoding: UTF-8
require 'open3'
require 'rspec/expectations'

前提(/^: '(\/home\/vagrant\/\.rbenv\/bin\/rbenv)'ができている$/) do |file_path|
  File.exist?(file_path).should be_true
end

もし(/^: '(\/home\/vagrant\/\.rbenv\/bin\/rbenv \-v)'を実行する$/) do |cmd|
  Open3.popen3(cmd) do |stdin, stdout, stderr|
    @cmd_stdout =  stdout.readline
  end
end

ならば(/^: 出力に以下が含まれている$/) do |string|
  @cmd_stdout.should match('rbenv')
end
