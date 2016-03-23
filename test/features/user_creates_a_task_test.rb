require_relative '../test_helper'

class UserCreatesTask < Minitest::Test
  include TestHelpers
  include Capybara::DSL


  def test_user_is_shown_new_page_when_new_task_is_cicked
    visit '/'

    click_link("New Task")
    assert_equal "/tasks/new", current_path
  end

  def test_user_can_submit_title_and_description_of_task_and_sees_task_at_index

    visit '/'
    click_link("New Task")
    fill_in('task[title]', with: "test")
    fill_in('task[description]', with: "test")
    click_button ("Add Task")

    within "#tasks" do
      assert page.has_content?("test")
    end
  end



end
