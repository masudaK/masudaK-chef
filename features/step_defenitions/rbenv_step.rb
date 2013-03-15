# encoding: UTF-8

前提(/^: "(.*?)"ができている$/) do |file|
  check_file_presence([file], true)
end

ならば(/^: rbenvコマンドが使えるようになっている$/) do
  run_interactive(unescape('rbenv'))
end

前提(/^: "(.*?)"と実行する$/) do |cmd|
  @execute_command='ruby -v'
  unless @execute_command.nil?
    steps %Q{ When I run `#{@execute_command} "#{cmd}"` }
  else
    @execute_failed=true
    raise "No input command specified"
  end
end

ならば(/^: 終了ステータスが(\d+)だ$/) do |expected|
  assert_partial_output(expected, all_output)
end
