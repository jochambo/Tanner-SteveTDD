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
      task.stub(:status) {"YOLO"}
      task.mark_as_incomplete!
      expect(task.status).to eq("incomplete")
    end
  end

  context "#complete?" do
    it "returns true when status is complete" do
      task.stub(:status) {"complete"}
      expect(task.complete?).to eq(true)
    end

    it "returns false when status is incomplete" do
      task.stub(:status) {"incomplete"}
      expect(task.complete?).to eq(false)
    end
  end
end
