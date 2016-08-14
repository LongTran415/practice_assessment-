require_relative "spec_helper"

describe DamageReport do
  let (:report) { DamageReport.new(description: "Broken tent.") }

  it "has a description" do
    expect(report.description).to eq "Broken tent."
  end

  it "initializes as unresolved" do
    expect(report).to_not be_resolved
  end

  it "can be resolved" do
    report.close
    expect(report).to be_resolved
  end

  describe "follow up person" do
    it "reports whether or not an employee has been assigned" do
      expect(report).to_not be_assigned
    end

    it "can have an assigned employee" do
      expect(report).to respond_to :assigned_employee=
    end

    it "has an assigned employee" do
      report.assigned_employee = "Jane"
      expect(report.assigned_employee).to eq "Jane"
    end
  end
end
