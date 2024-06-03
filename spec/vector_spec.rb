# frozen_string_literal: true

RSpec.describe RGraph::Vector do
  describe ".null" do
    subject { described_class.null(size) }

    let(:size) { 2 }

    it "must create an empty Vector" do
      vector = subject

      expect(vector).to be_a(RGraph::Vector)
    end
  end

  describe ".destroy" do
    let(:vector) { described_class.null(2) }

    it "must restroy a Vector" do
      vector.destroy
    end
  end

  describe ".from_array" do
    subject { described_class.from_array(data) }

    let(:data) { [1, 2, 3, 4] }

    it "must create a Vector from array" do
      vector = subject

      expect(vector).to be_a(RGraph::Vector)
    end
  end
end
