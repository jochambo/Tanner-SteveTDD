require 'rspec'
require_relative 'todo'

describe "Task" do
  let(:task) {Task.new("title", "description")}
  context "#initialize" do
    it "creates a task!" do
      expect(task).to be_an_instance_of Task
    end

    # it "creates a title for Task" do
    # end
  end

  context "#title" do
    it "returns the title" do
      expect(task.title).to eq("title")
    end
  end

  context "#description" do
    it "returns the description" do
      exepct(task.description).to eq("description")
    end
  end

  context "#status" do
    it 'defaults as Incomplete' do
      expect(task.status).to eq("incomplete")
    end
  end

  context "#created_at" do
    it 'defaults to when it was initialized' do
      expect(task.created_at).to be_an_instance_of Time
    end
  end

  context "#mark_as_complete!" do
    it "changes the status of a task to complete" do
      task.mark_as_complete!
      expect(task.status).to eq("complete")
    end
  end

  context "#mark_as_incomplete!" do
    it "changes the status of a task to incomplete" do
      task.mark_as_complete!
      task.mark_as_incomplete!
      expect(task.status).to eq("incomplete")
    end
  end

  context "#complete?" do
    it "returns true when status is complete" do
      task.stub(:status => "complete")
      expect(task.complete?).to eq(true)
    end

    it "returns false when status is incomplete" do
      task.stub(:status => "incomplete")
      expect(task.complete?).to eq(false)
    end
  end
end

describe "Todo" do
  let(:todo) {Todo.new("title")}

  context "#title" do
    it "returns the title" do
      expect(todo.title).to eq("title")
    end
  end

  context "#tasks" do
    it "is an array" do
      expect(todo.tasks).to be_an_instance_of Array
    end
  end

  context "#add_task" do
    it "should add a task to todo" do
      task = double("Task")
      todo.add_task(task)
      expect(todo.tasks.length).to eq(1)
    end
  end


#might be broken, but honestly, probably not, cause we're super cewl. Also, this comment isnt here.
  context "#complete_all!" do
    it "changes all tasks status' to complete" do
      task_dummy = double("Task")
      todo.add_task(task_dummy)
      task_dummy.should_receive(:mark_as_complete!)
      todo.complete_all!
    end
  end
  #ask instructors, bruh
  context "#complete?" do
    it "returns false if any task is incomplete" do
      5.times do
        task_dummy = double("Task")
        task_dummy.stub(:status => "complete")
        task_dummy.stub(:complete? => true)
        todo.add_task(task_dummy)
      end

      task_dummy = double("Task")
      task_dummy.stub(:status => "incomplete")
      task_dummy.stub(:complete? => false)
      todo.add_task(task_dummy)

      expect(todo.complete?).to eq(false)
    end

    it "returns true if all task are complete" do
      5.times do
        task_dummy = double("Task")
        task_dummy.stub(:status => "complete")
        task_dummy.stub(:complete? => true)
        todo.add_task(task_dummy)
      end
      expect(todo.complete?).to eq(true)
    end
  end

  context "#completed_tasks" do
    #3 completed tasks
    it "returns an array of all completed tasks" do
      3.times do
        task_dummy = double("Task")
        task_dummy.stub(:status => "complete")
        task_dummy.stub(:complete? => true)
        todo.add_task(task_dummy)
      end
      #4 incomplete tasks
      4.times do
        task_dummy = double("Task")
        task_dummy.stub(:status => "incomplete")
        task_dummy.stub(:complete? => false)
        todo.add_task(task_dummy)
      end
      expect(todo.completed_tasks.length).to eq(3)
    end
  end

  context "#incomplete_tasks" do
    it "returns an array of all incomplete tasks" do
      3.times do
        task_dummy = double("Task")
        task_dummy.stub(:status => "complete")
        task_dummy.stub(:complete? => true)
        todo.add_task(task_dummy)
      end
      #4 incomplete tasks
      4.times do
        task_dummy = double("Task")
        task_dummy.stub(:status => "incomplete")
        task_dummy.stub(:complete? => false)
        todo.add_task(task_dummy)
      end
      expect(todo.incomplete_tasks.length).to eq(4)
    end
  end
end



