require_relative "../test_helper"

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    task_manager.create({
      title: "Task Title",
      description: "Task Description"
      })

    task = task_manager.find(1)

    assert_equal "Task Title", task.title
    assert_equal "Task Description", task.description
    assert_equal 1, task.id
  end

  def test_all_returns_array_of_tasks
    task_manager.create({
      title: "Task Title",
      description: "Task Description"
      })

    assert_equal Array, task_manager.all.class
  end


  def test_find_returns_matching_task_object
    task_manager.create({
      title: "Task Title",
      description: "Task Description"
      })

    assert_equal 'Task Title', task_manager.find(1).title
  end

  def test_update_changes_existing_task
    task_manager.create({
      title: "Task Title",
      description: "Task Description"
      })

    task_manager.update(1, {
      title: "Task Title 2"
      })

    task = task_manager.find(1)
    assert_equal "Task Title 2", task.title
  end

  def test_destroy_deletes_task_from_database
    task_manager.create({
      title: "Task Title",
      description: "Task Description"
      })

    task_manager.create({
      title: "Task Title 2",
      description: "Task 2 Description"
      })

    task_manager.destroy(2)

    assert_equal 1, task_manager.all.count
  end


end
