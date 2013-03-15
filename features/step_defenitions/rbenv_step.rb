# encoding: UTF-8

前提(/^: "(.*?)"と実行する$/) do |exit_status|
  @last_exit_status.should == exit_status.to_i
end

