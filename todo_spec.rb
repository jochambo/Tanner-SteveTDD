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
      expect(task.description).to eq("description")
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
end
