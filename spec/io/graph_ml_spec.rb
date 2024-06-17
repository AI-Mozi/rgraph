# frozen_string_literal: true

RSpec.describe RGraph::IO::GraphML do
  let(:fixtures)     { File.join(File.expand_path(__dir__), "..", "fixtures") }
  let(:graphml_path) { File.join(fixtures, "graphml", "watts_strogatz_game.graphml") }
  let(:graphml_file) { File.read(graphml_path) }

  describe "#write" do
    subject { graph.write(path) }

    after do
      FileUtils.rm_f(path)
    end

    let(:graph) { RGraph::Graph.watts_strogatz_game(1, 1, 1, 0.5) }
    let(:path)  { "spec/test.graphml" }

    it "must create a new graphml file and write a result into it" do
      subject

      expect(File.exist?(path)).to be(true)
      expect(File.read(path)).to eq(graphml_file)
    end
  end

  describe "#read" do
    subject { IOGraphML.read(graphml_path) }

    class IOGraphML
      include RGraph::IO::GraphML
    end

    it "must create new graph instance from a file" do
      graph = subject

      expect(graph).to be_a(RGraph::Graph)
      expect(graph.vertices_count).to eq(1)
    end
  end
end
