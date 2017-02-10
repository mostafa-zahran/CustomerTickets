require 'test_helper'
class TicketTest < ActiveSupport::TestCase

  setup do
    @new_ticket = Ticket.new
  end

  test 'Ticket class exists' do
    assert class_exists?(Ticket)
  end

  test 'A ticket has title' do
    assert ticket_has_attribute?(:title)
  end

  test 'A ticket has a default title' do
    assert @new_ticket.title == Ticket::DEFAULT_TITLE
  end

  test 'A ticket has description' do
    assert ticket_has_attribute?(:description)
  end

  test 'A ticket has created_at' do
    assert ticket_has_attribute?(:created_at)
  end

  test 'A ticket has status' do
    assert ticket_has_attribute?(:status)
  end

  test 'A ticket has a default status' do
    assert @new_ticket.status == TicketStatus::OPEN
  end

  test 'A ticket has updated_at' do
    assert ticket_has_attribute?(:updated_at)
  end

  test 'A ticket has creator_id' do
    assert ticket_has_attribute?(:creator_id)
  end

  test 'A ticket has closer_id' do
    assert ticket_has_attribute?(:closer_id)
  end

  test 'A ticket has creator' do
    assert ticket_can_respond_to?(:creator)
  end

  test 'A ticket has closer' do
    assert ticket_can_respond_to?(:closer)
  end

  test 'A ticket should has creator' do
    assert_not @new_ticket.valid?
  end

  # test 'A closed ticket should has closer' do
  #   ticket = create(:ticket)
  #   ticket.status = TicketStatus::CLOSE
  #   assert_not ticket.save
  # end

  private

  def ticket_has_attribute?(attribute_name)
    obj_has_attribute?(@new_ticket, attribute_name)
  end

  def ticket_can_respond_to?(method_name)
    obj_can_respond_to?(@new_ticket, method_name)
  end
end