require 'spec_helper'

describe Job do

  #let(:user) { FactoryGirl.create(:user) }
  before { @job = Job.new(title:"Rails Dev", description:"Job description", duties:"Job duties") }

  subject { @job }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:duties) }

  it { should be_valid }

  describe "when title is not present" do
    before { @job.title = " " }
    it { should_not be_valid }
  end

  describe "with description is not present" do
    before { @job.description = " " }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @job.title = "a" * 141 }
    it { should_not be_valid }
  end
end