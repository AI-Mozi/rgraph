# frozen_string_literal: true

RSpec.describe RGraph::IO::GraphML do
  describe "#write" do
    subject { graph.write(path) }

    after do
      FileUtils.rm_f(path)
    end

    let(:fixtures)     { File.join(File.expand_path(__dir__), "..", "fixtures") }
    let(:graphml_file) { File.join(fixtures, "graphml", "watts_strogatz_game.graphml") }
    let(:expected)     { File.read(graphml_file) }
    let(:graph)        { RGraph::Graph.watts_strogatz_game(1, 1, 1, 0.5) }
    let(:path)         { "spec/test.graphml" }

    it "must create a new graphml file and write a result into it" do
      subject

      expect(File.exist?(path)).to be(true)
      expect(File.read(path)).to eq(expected)
    end
  end
end
