# require 'test_helper'
# class GetAgentPageTest < ActiveSupport::TestCase
#
#   setup do
#     (0...BULK_CREATE_SIZE).each {|i| create(:admin_creates_agent, email: "xxxx#{i}@xxx.xxx")}
#   end
#
#   test 'Get Agent Page interactor exists' do
#     class_exists?(GetAgentPage)
#   end
#
#   test 'send page' do
#     result = GetAgentPage.call(response: {authenticated: true}, page: 1, per_page: BULK_CREATE_SIZE-1)
#     assert result.success?
#     assert result.response[:agents].size == BULK_CREATE_SIZE-1
#   end
#
#   test 'Do not send page' do
#     result = GetAgentPage.call(response: {authenticated: true})
#     assert result.success?
#     assert result.response[:agents].size == BULK_CREATE_SIZE
#   end
# end