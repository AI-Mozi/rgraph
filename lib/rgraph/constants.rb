# frozen_string_literal: true

module RGraph
  module Constants
    #
    # Algorithms for random tree generation.
    #
    module TreeMode
      OUT        = 0
      IN         = 1
      UNDIRECTED = 2
    end

    #
    # Types of the star graphs.
    #
    module StarMode
      OUT        = 0
      IN         = 1
      UNDIRECTED = 2
      MUTUAL     = 3
    end

    #
    # Types of the Erdos Renyi graphs.
    #
    module ErdosRenyi
      GNP = 0
      GNM = 1
    end
  end
end
