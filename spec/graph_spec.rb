# frozen_string_literal: true

require_relative "../lib/rgraph/constants"

RSpec.describe RGraph::Graph do
  describe ".empty" do
    subject { described_class.empty(size, directed: directed) }

    let(:size) { 2 }

    context "when directed is set to true" do
      let(:directed) { true }

      it "must create an empty directed graph" do
        graph = subject

        expect(graph).to be_a(RGraph::Graph)
      end
    end

    context "when directed is set to false" do
      let(:directed) { false }

      it "must create an empty undirected graph" do
        graph = subject

        expect(graph).to be_a(RGraph::Graph)
      end
    end
  end

  describe ".full" do
    subject { described_class.full(size, directed: directed, loops: loops) }

    let(:size) { 2 }

    context "when directed is set to true" do
      let(:directed) { true }

      context "when loops is set to true" do
        let(:loops) { true }

        it "must create a full, directed graph with loops" do
          graph = subject

          expect(graph).to be_a(RGraph::Graph)
        end
      end

      context "when loops is set to false" do
        let(:loops) { false }

        it "must create a full, directed graph without loops" do
          graph = subject

          expect(graph).to be_a(RGraph::Graph)
        end
      end
    end

    context "when directed is set to fasle" do
      let(:directed) { false }

      context "when loops is set to true" do
        let(:loops) { true }

        it "must create a full, undirected graph with loops" do
          graph = subject

          expect(graph).to be_a(RGraph::Graph)
        end
      end

      context "when loops is set to false" do
        let(:loops) { false }

        it "must create a full, undirected graph without loops" do
          graph = subject

          expect(graph).to be_a(RGraph::Graph)
        end
      end
    end

    context "when size is less than 2" do
      let(:size)     { 1 }
      let(:directed) { false }
      let(:loops)    { false }

      it "must raise an ArgumentError" do
        expect { subject }.to raise_error(ArgumentError, "#{size.inspect} is an invalid number of vertices.")
      end
    end
  end

  describe ".ring" do
    subject { described_class.ring(size, directed: directed, mutual: mutual, circular: circular) }

    let(:size)     { 2 }
    let(:directed) { false }
    let(:mutual)   { false }
    let(:circular) { false }

    context "for size less than zero" do
      let(:size) { -1 }

      it "must raise an ArgumentError" do
        expect {
          subject
        }.to raise_error(ArgumentError, "#{size.inspect} is an invalid number of vertices. Can't be negative.")
      end
    end

    context "when directed is set to true" do
      let(:directed) { true }

      context "when mutual is set to true" do
        let(:mutual) { true }

        it "must create a directed, mutual ring graph" do
          graph = subject

          expect(graph).to be_a(RGraph::Graph)
        end
      end

      context "when circular is set to true" do
        let(:circular) { true }

        it "must create a directed, circular ring graph" do
          graph = subject

          expect(graph).to be_a(RGraph::Graph)
        end
      end
    end

    context "when directed is set to false" do
      context "when mutual is set to true" do
        let(:mutual) { true }

        it "must create a undirected, mutual ring graph" do
          graph = subject

          expect(graph).to be_a(RGraph::Graph)
        end
      end

      context "when circular is set to true" do
        let(:circular) { true }

        it "must create a undirected, circular ring graph" do
          graph = subject

          expect(graph).to be_a(RGraph::Graph)
        end
      end
    end
  end

  describe ".kary_tree" do
    subject { described_class.kary_tree(size, children, type) }

    let(:size)     { 2 }
    let(:children) { 1 }
    let(:type)     { RGraph::Constants::TreeMode::IN }

    context "when size is less than 0" do
      let(:size) { -1 }

      it "must raise an ArgumentError" do
        expect {
          subject
        }.to raise_error(ArgumentError, "#{size.inspect} is an invalid number of vertices. Can't be negative.")
      end
    end

    context "when children is less or equat to zero" do
      let(:children) { 0 }

      it "must raise an ArgumentError" do
        expect {
          subject
        }.to raise_error(ArgumentError, "#{children.inspect} is an invalid number of children. Must be positive.")
      end
    end

    context "when type is invalid" do
      let(:type) { -1 }

      it "must raise an ArgumentError" do
        expect {
          subject
        }.to raise_error(ArgumentError, "#{type.inspect} is an invalid tree orientation type.")
      end
    end

    context "for valid size, number of children and type" do
      it "must create a tree" do
        graph = subject

        expect(graph).to be_a(RGraph::Graph)
      end
    end
  end

  describe ".star" do
    subject { described_class.star(size, mode, center) }

    let(:size)   { 2 }
    let(:mode)   { RGraph::Constants::StarMode::IN }
    let(:center) { 1 }

    context "for size less than zero" do
      let(:size) { -1 }

      it "must raise an ArgumentError" do
        expect {
          subject
        }.to raise_error(ArgumentError, "#{size.inspect} is an invalid number of vertices. Can't be negative.")
      end
    end

    context "for center less than zero or more than size - 1" do
      let(:center) { -1 }

      it "must raise an ArgumentError" do
        expect {
          subject
        }.to raise_error(ArgumentError, "#{center.inspect} is an invalid center vertex.")
      end
    end

    context "for invalid mode" do
      let(:mode) { -5 }

      it "must raise an ArgumentError" do
        expect {
          subject
        }.to raise_error(ArgumentError, "#{mode} is an invalid star mode.")
      end
    end

    context "for valid size, mode and center" do
      it "must create a star graph" do
        graph = subject

        expect(graph).to be_a(RGraph::Graph)
      end
    end
  end

  describe ".wheel" do
    let(:size)   { 2 }
    let(:mode)   { Constants::StarMode::IN }
    let(:center) { 1 }

    context "for valid size, mode and center" do
      it "must create a wheel graph" do
        graph = subject

        expect(graph).to be_a(RGraph::Graph)
      end
    end
  end

  describe "#add_edge" do
    subject { graph.add_edge(from, to) }

    let(:graph) { RGraph::Graph.empty(2) }
    let(:from)  { 1 }
    let(:to)    { 1 }

    it "must add an edge to a graph" do
      subject

      expect(graph.edges_count).to be(1)
    end
  end

  describe "#edges_count" do
    subject { graph.edges_count }

    let(:graph) { RGraph::Graph.empty(2) }

    before do
      graph.add_edge(1, 1)
    end

    it "must return number of edges in a graph" do
      expect(subject).to eq(1)
    end
  end

  describe "#vertices_count" do
    subject { graph.vertices_count }

    let(:graph) { RGraph::Graph.empty(2) }

    it "must return number of vertices in a graph" do
      expect(subject).to eq(2)
    end
  end

  describe "#directed?" do
    subject { graph.directed? }

    let(:graph) { RGraph::Graph.empty(2, directed: directed) }

    context "for directed graph" do
      let(:directed) { true }

      it "must return true" do
        expect(subject).to be(true)
      end
    end

    context "for undirected graph" do
      let(:directed) { false }

      it "must return false" do
        expect(subject).to be(false)
      end
    end
  end

  describe "#==" do
    subject { graph == other }

    let(:graph) { RGraph::Graph.empty(2) }

    context "for the same graphs" do
      let(:other) { RGraph::Graph.empty(2) }

      it "must return true" do
        expect(subject).to be(true)
      end
    end

    context "for different graphs" do
      let(:other) { RGraph::Graph.empty(4) }

      it "must return false" do
        expect(subject).to be(false)
      end
    end
  end

  describe "#copy" do
    subject { graph.copy }

    let(:graph) { RGraph::Graph.empty(2) }

    it "must create new copy of a graph" do
      result = subject

      expect(result).to be_a(RGraph::Graph)
      expect(result == graph).to be(true)
    end
  end

  describe "#add_vertices" do
    subject { graph.add_vertices(number) }

    let(:graph)  { RGraph::Graph.empty(0) }
    let(:number) { 2 }

    it "must add vertices to a graph" do
      subject

      expect(graph.vertices_count).to eq(2)
    end

    context "for invalid number of vertices to add" do
      let(:number) { -1 }

      it "must raise an ArgumentError" do
        expect {
          subject
        }.to raise_error(ArgumentError, "#{number.inspect} is an invalid value. Must be positive.")
      end
    end
  end

  describe "#simplify" do
    subject { graph.simplify }

    let(:graph) { RGraph::Graph.empty(3) }

    before do
      graph.add_edge(0, 1)
      graph.add_edge(0, 1)
      graph.add_edge(1, 1)
    end

    it "must remove multiple edges and loops" do
      subject

      expect(graph.edges_count).to eq(1)
      expect(graph.edge?(1, 1)).to be(false)
    end
  end

  describe "#edge?" do
    subject { graph.edge?(from, to) }

    let(:graph) { RGraph::Graph.empty(3) }
    let(:from)  { 0 }
    let(:to)    { 1 }

    context "when graph contains the edge" do
      before do
        graph.add_edge(from, to)
      end

      it "must return true" do
        expect(subject).to be(true)
      end
    end

    context "when graph does not contain the edge" do
      let(:from) { 1 }
      let(:to)   { 1 }

      it "must return false" do
        expect(subject).to be(false)
      end
    end
  end
end
