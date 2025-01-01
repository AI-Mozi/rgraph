require "ffi"

require_relative "types"

module LibC
  extend FFI::Library

  def self.load_libc
    case RbConfig::CONFIG['host_os']
    when /mswin|mingw|cygwin/
      ffi_lib 'msvcrt.dll'
    when /darwin/
      ffi_lib 'libc.dylib'
    when /linux/
      ffi_lib 'libc.so.6'
    else
      raise 'Cannot import C standard library on this platform'
    end
  end

  load_libc

  attach_function :fclose, [:pointer], :int
  attach_function :fflush, [:pointer], :int
  attach_function :fdopen, [:int, :string], :pointer
end

module IgraphC
  extend FFI::Library
  ffi_lib :igraph

  # Vector type

  attach_function :igraph_vector_init, [:pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_vector_destroy, [:pointer], :void

  # Integer vector type

  attach_function :igraph_vector_int_init, [:pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_vector_int_destroy, [:pointer], :void

  attach_function :igraph_vector_int_push_back, [:pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  # Bool vector type

  attach_function :igraph_vector_int_init, [:pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_vector_int_destroy, [:pointer], :void
end
# Set up aliases for all enum types

IGRAPH_ADD_WEIGHTS_T = :int
IGRAPH_ADJACENCY_T = :int
IGRAPH_BARABASI_ALGORITHM_T = :int
IGRAPH_BLISS_SH_T = :int
IGRAPH_COLORING_GREEDY_T = :int
IGRAPH_COMMUNITY_COMPARISON_T = :int
IGRAPH_CONNECTEDNESS_T = :int
IGRAPH_DEGSEQ_T = :int
IGRAPH_EIGEN_ALGORITHM_T = :int
IGRAPH_EIGEN_WHICH_POSITION_T = :int
IGRAPH_ERDOS_RENYI_T = :int
IGRAPH_FAS_ALGORITHM_T = :int
IGRAPH_FLOYD_WARSHALL_ALGORITHM_T = :int
IGRAPH_GET_ADJACENCY_T = :int
IGRAPH_IMITATE_ALGORITHM_T = :int
IGRAPH_LAPLACIAN_NORMALIZATION_T = :int
IGRAPH_LAPLACIAN_SPECTRAL_EMBEDDING_TYPE_T = :int
IGRAPH_LAYOUT_GRID_T = :int
IGRAPH_LOOPS_T = :int
IGRAPH_NEIMODE_T = :int
IGRAPH_OPTIMAL_T = :int
IGRAPH_PAGERANK_ALGO_T = :int
IGRAPH_RANDOM_TREE_T = :int
IGRAPH_RANDOM_WALK_STUCK_T = :int
IGRAPH_REALIZE_DEGSEQ_T = :int
IGRAPH_RECIPROCITY_T = :int
IGRAPH_REWIRING_T = :int
IGRAPH_ROOT_CHOICE_T = :int
IGRAPH_SPINCOMM_UPDATE_T = :int
IGRAPH_SPINGLASS_IMPLEMENTATION_T = :int
IGRAPH_STAR_MODE_T = :int
IGRAPH_SUBGRAPH_IMPLEMENTATION_T = :int
IGRAPH_TO_DIRECTED_T = :int
IGRAPH_TO_UNDIRECTED_T = :int
IGRAPH_TRANSITIVITY_MODE_T = :int
IGRAPH_TREE_MODE_T = :int
IGRAPH_VCONN_NEI_T = :int
IGRAPH_VORONOI_TIEBREAKER_T = :int
IGRAPH_WHEEL_MODE_T = :int

# Set up aliases for all bitfield types

IGRAPH_EDGE_TYPE_SW_T = :int
IGRAPH_WRITE_GML_SW_T = :int

# Add argument and return types for functions imported from igraph
module IgraphC
  attach_function :igraph_empty, [:pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_add_edges, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_empty_attrs, [:pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_add_vertices, [:pointer, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_copy, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_delete_edges, [:pointer, IGRAPH_ES_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_delete_vertices, [:pointer, IGRAPH_VS_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_delete_vertices_idx, [:pointer, IGRAPH_VS_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_vcount, [:pointer], IGRAPH_INTEGER_T

  attach_function :igraph_ecount, [:pointer], IGRAPH_INTEGER_T

  attach_function :igraph_neighbors, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_directed, [:pointer], IGRAPH_BOOL_T

  attach_function :igraph_degree, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_edge, [:pointer, IGRAPH_INTEGER_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_edges, [:pointer, IGRAPH_ES_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_eid, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_eids, [:pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_all_eids_between, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_incident, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_same_graph, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_create, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_adjacency, [:pointer, :pointer, IGRAPH_ADJACENCY_T, IGRAPH_LOOPS_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_sparse_adjacency, [:pointer, :pointer, IGRAPH_ADJACENCY_T, IGRAPH_LOOPS_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_sparse_weighted_adjacency, [:pointer, :pointer, IGRAPH_ADJACENCY_T, :pointer, IGRAPH_LOOPS_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_weighted_adjacency, [:pointer, :pointer, IGRAPH_ADJACENCY_T, :pointer, IGRAPH_LOOPS_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_star, [:pointer, IGRAPH_INTEGER_T, IGRAPH_STAR_MODE_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_wheel, [:pointer, IGRAPH_INTEGER_T, IGRAPH_WHEEL_MODE_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_square_lattice, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_triangular_lattice, [:pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_ring, [:pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_kary_tree, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_TREE_MODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_symmetric_tree, [:pointer, :pointer, IGRAPH_TREE_MODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_regular_tree, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_TREE_MODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_full, [:pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_full_citation, [:pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_atlas, [:pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_extended_chordal_ring, [:pointer, IGRAPH_INTEGER_T, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_connect_neighborhood, [:pointer, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_graph_power, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_linegraph, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_de_bruijn, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_kautz, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_famous, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_lcf_vector, [:pointer, IGRAPH_INTEGER_T, :pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_adjlist, [:pointer, :pointer, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_full_bipartite, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_full_multipartite, [:pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_realize_degree_sequence, [:pointer, :pointer, :pointer, IGRAPH_EDGE_TYPE_SW_T, IGRAPH_REALIZE_DEGSEQ_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_realize_bipartite_degree_sequence, [:pointer, :pointer, :pointer, IGRAPH_EDGE_TYPE_SW_T, IGRAPH_REALIZE_DEGSEQ_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_circulant, [:pointer, IGRAPH_INTEGER_T, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_generalized_petersen, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_turan, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_weighted_sparsemat, [:pointer, :pointer, IGRAPH_BOOL_T, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_barabasi_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_INTEGER_T, :pointer, IGRAPH_BOOL_T, IGRAPH_REAL_T, IGRAPH_BOOL_T, IGRAPH_BARABASI_ALGORITHM_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_erdos_renyi_game_gnp, [:pointer, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_erdos_renyi_game_gnm, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_degree_sequence_game, [:pointer, :pointer, :pointer, IGRAPH_DEGSEQ_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_growing_random_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_barabasi_aging_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, IGRAPH_BOOL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_recent_degree_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, IGRAPH_BOOL_T, IGRAPH_REAL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_recent_degree_aging_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, IGRAPH_BOOL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_callaway_traits_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, :pointer, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_establishment_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, :pointer, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_grg_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_BOOL_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_preference_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, IGRAPH_BOOL_T, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_asymmetric_preference_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, :pointer, :pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_rewire_edges, [:pointer, IGRAPH_REAL_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_rewire_directed_edges, [:pointer, IGRAPH_REAL_T, IGRAPH_BOOL_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_watts_strogatz_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_lastcit_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_cited_type_game, [:pointer, IGRAPH_INTEGER_T, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_citing_cited_type_game, [:pointer, IGRAPH_INTEGER_T, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_forest_fire_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_INTEGER_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_simple_interconnected_islands_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_static_fitness_game, [:pointer, IGRAPH_INTEGER_T, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_static_power_law_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_k_regular_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_sbm_game, [:pointer, IGRAPH_INTEGER_T, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_hsbm_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, :pointer, IGRAPH_REAL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_hsbm_list_game, [:pointer, IGRAPH_INTEGER_T, :pointer, :pointer, :pointer, IGRAPH_REAL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_correlated_game, [:pointer, :pointer, IGRAPH_REAL_T, IGRAPH_REAL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_correlated_pair_game, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_dot_product_game, [:pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_sample_sphere_surface, [IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_sample_sphere_volume, [IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_sample_dirichlet, [IGRAPH_INTEGER_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_are_adjacent, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_are_connected, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_diameter, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_diameter_dijkstra, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_closeness, [:pointer, :pointer, :pointer, :pointer, IGRAPH_VS_T, IGRAPH_NEIMODE_T, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_closeness_cutoff, [:pointer, :pointer, :pointer, :pointer, IGRAPH_VS_T, IGRAPH_NEIMODE_T, :pointer, IGRAPH_BOOL_T, IGRAPH_REAL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_distances, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_VS_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_distances_cutoff, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_VS_T, IGRAPH_NEIMODE_T, IGRAPH_REAL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_shortest_path, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_shortest_path_bellman_ford, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_shortest_path_dijkstra, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_shortest_path_astar, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, IGRAPH_NEIMODE_T, IGRAPH_ASTAR_HEURISTIC_FUNC_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_shortest_paths, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_VS_T, IGRAPH_NEIMODE_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_all_shortest_paths, [:pointer, :pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_VS_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_distances_dijkstra, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_VS_T, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_distances_dijkstra_cutoff, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_VS_T, :pointer, IGRAPH_NEIMODE_T, IGRAPH_REAL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_shortest_paths_dijkstra, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_VS_T, :pointer, IGRAPH_NEIMODE_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_shortest_paths_bellman_ford, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_VS_T, :pointer, IGRAPH_NEIMODE_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_all_shortest_paths_dijkstra, [:pointer, :pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_VS_T, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_distances_bellman_ford, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_VS_T, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_distances_johnson, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_VS_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_distances_floyd_warshall, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_VS_T, :pointer, IGRAPH_NEIMODE_T, IGRAPH_FLOYD_WARSHALL_ALGORITHM_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_voronoi, [:pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_NEIMODE_T, IGRAPH_VORONOI_TIEBREAKER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_all_simple_paths, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_VS_T, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_k_shortest_paths, [:pointer, :pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_widest_path, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_widest_paths, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_VS_T, :pointer, IGRAPH_NEIMODE_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_widest_path_widths_dijkstra, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_VS_T, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_widest_path_widths_floyd_warshall, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_VS_T, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_spanner, [:pointer, :pointer, IGRAPH_REAL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_subcomponent, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_betweenness, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_betweenness_cutoff, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_BOOL_T, :pointer, IGRAPH_REAL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_betweenness_subset, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_BOOL_T, IGRAPH_VS_T, IGRAPH_VS_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_edge_betweenness, [:pointer, :pointer, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_edge_betweenness_cutoff, [:pointer, :pointer, IGRAPH_BOOL_T, :pointer, IGRAPH_REAL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_edge_betweenness_subset, [:pointer, :pointer, IGRAPH_ES_T, IGRAPH_BOOL_T, IGRAPH_VS_T, IGRAPH_VS_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_harmonic_centrality, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_NEIMODE_T, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_harmonic_centrality_cutoff, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_NEIMODE_T, :pointer, IGRAPH_BOOL_T, IGRAPH_REAL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_pagerank, [:pointer, IGRAPH_PAGERANK_ALGO_T, :pointer, :pointer, IGRAPH_VS_T, IGRAPH_BOOL_T, IGRAPH_REAL_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_personalized_pagerank, [:pointer, IGRAPH_PAGERANK_ALGO_T, :pointer, :pointer, IGRAPH_VS_T, IGRAPH_BOOL_T, IGRAPH_REAL_T, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_personalized_pagerank_vs, [:pointer, IGRAPH_PAGERANK_ALGO_T, :pointer, :pointer, IGRAPH_VS_T, IGRAPH_BOOL_T, IGRAPH_REAL_T, IGRAPH_VS_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_rewire, [:pointer, IGRAPH_INTEGER_T, IGRAPH_REWIRING_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_induced_subgraph, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_SUBGRAPH_IMPLEMENTATION_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_subgraph_from_edges, [:pointer, :pointer, IGRAPH_ES_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_reverse_edges, [:pointer, IGRAPH_ES_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_average_path_length, [:pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_average_path_length_dijkstra, [:pointer, :pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_path_length_hist, [:pointer, :pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_simplify, [:pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_transitivity_undirected, [:pointer, :pointer, IGRAPH_TRANSITIVITY_MODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_transitivity_local_undirected, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_TRANSITIVITY_MODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_transitivity_avglocal_undirected, [:pointer, :pointer, IGRAPH_TRANSITIVITY_MODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_transitivity_barrat, [:pointer, :pointer, IGRAPH_VS_T, :pointer, IGRAPH_TRANSITIVITY_MODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_ecc, [:pointer, :pointer, IGRAPH_ES_T, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_reciprocity, [:pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_RECIPROCITY_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_constraint, [:pointer, :pointer, IGRAPH_VS_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_maxdegree, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_density, [:pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_neighborhood_size, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_neighborhood, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_neighborhood_graphs, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_topological_sorting, [:pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_feedback_arc_set, [:pointer, :pointer, :pointer, IGRAPH_FAS_ALGORITHM_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_loop, [:pointer, :pointer, IGRAPH_ES_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_dag, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_acyclic, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_simple, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_multiple, [:pointer, :pointer, IGRAPH_ES_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_has_loop, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_has_multiple, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_count_multiple, [:pointer, :pointer, IGRAPH_ES_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_girth, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_perfect, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_add_edge, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_eigenvector_centrality, [:pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_hub_score, [:pointer, :pointer, :pointer, IGRAPH_BOOL_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_authority_score, [:pointer, :pointer, :pointer, IGRAPH_BOOL_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_hub_and_authority_scores, [:pointer, :pointer, :pointer, :pointer, IGRAPH_BOOL_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_unfold_tree, [:pointer, :pointer, IGRAPH_NEIMODE_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_mutual, [:pointer, :pointer, IGRAPH_ES_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_has_mutual, [:pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_maximum_cardinality_search, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_chordal, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_avg_nearest_neighbor_degree, [:pointer, IGRAPH_VS_T, IGRAPH_NEIMODE_T, IGRAPH_NEIMODE_T, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_degree_correlation_vector, [:pointer, :pointer, :pointer, IGRAPH_NEIMODE_T, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_strength, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_centralization, [:pointer, IGRAPH_REAL_T, IGRAPH_BOOL_T], IGRAPH_REAL_T

  attach_function :igraph_centralization_degree, [:pointer, :pointer, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T, :pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_centralization_degree_tmax, [:pointer, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_centralization_betweenness, [:pointer, :pointer, IGRAPH_BOOL_T, :pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_centralization_betweenness_tmax, [:pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_centralization_closeness, [:pointer, :pointer, IGRAPH_NEIMODE_T, :pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_centralization_closeness_tmax, [:pointer, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_centralization_eigenvector_centrality, [:pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T, :pointer, :pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_centralization_eigenvector_centrality_tmax, [:pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_assortativity_nominal, [:pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_assortativity, [:pointer, :pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_assortativity_degree, [:pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_joint_degree_matrix, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_joint_degree_distribution, [:pointer, :pointer, :pointer, IGRAPH_NEIMODE_T, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_joint_type_distribution, [:pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_contract_vertices, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_eccentricity, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_eccentricity_dijkstra, [:pointer, :pointer, :pointer, IGRAPH_VS_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_graph_center, [:pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_graph_center_dijkstra, [:pointer, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_radius, [:pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_radius_dijkstra, [:pointer, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_pseudo_diameter, [:pointer, :pointer, IGRAPH_INTEGER_T, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_pseudo_diameter_dijkstra, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_diversity, [:pointer, :pointer, :pointer, IGRAPH_VS_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_random_walk, [:pointer, :pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T, IGRAPH_INTEGER_T, IGRAPH_RANDOM_WALK_STUCK_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_random_edge_walk, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T, IGRAPH_INTEGER_T, IGRAPH_RANDOM_WALK_STUCK_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_global_efficiency, [:pointer, :pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_local_efficiency, [:pointer, :pointer, IGRAPH_VS_T, :pointer, IGRAPH_BOOL_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_average_local_efficiency, [:pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_transitive_closure_dag, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_trussness, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_bigraphical, [:pointer, :pointer, IGRAPH_EDGE_TYPE_SW_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_graphical, [:pointer, :pointer, IGRAPH_EDGE_TYPE_SW_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_bfs, [:pointer, IGRAPH_INTEGER_T, :pointer, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_BFSHANDLER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_bfs_simple, [:pointer, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_dfs, [:pointer, IGRAPH_INTEGER_T, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T, :pointer, :pointer, :pointer, :pointer, IGRAPH_DFSHANDLER_T, IGRAPH_DFSHANDLER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_bipartite_projection_size, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_bipartite_projection, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_create_bipartite, [:pointer, :pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_biadjacency, [:pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_biadjacency, [:pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_bipartite, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_bipartite_game_gnp, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_BOOL_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_bipartite_game_gnm, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_bipartite_game, [:pointer, :pointer, IGRAPH_ERDOS_RENYI_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_laplacian, [:pointer, :pointer, IGRAPH_NEIMODE_T, IGRAPH_LAPLACIAN_NORMALIZATION_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_laplacian_sparse, [:pointer, :pointer, IGRAPH_NEIMODE_T, IGRAPH_LAPLACIAN_NORMALIZATION_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_connected_components, [:pointer, :pointer, :pointer, :pointer, IGRAPH_CONNECTEDNESS_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_connected, [:pointer, :pointer, IGRAPH_CONNECTEDNESS_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_decompose, [:pointer, :pointer, IGRAPH_CONNECTEDNESS_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_articulation_points, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_biconnected_components, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_bridges, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_biconnected, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_cliques, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_cliques_callback, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_CLIQUE_HANDLER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_clique_size_hist, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_largest_cliques, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_maximal_cliques, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_maximal_cliques_subset, [:pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_maximal_cliques_callback, [:pointer, IGRAPH_CLIQUE_HANDLER_T, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_maximal_cliques_count, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_maximal_cliques_file, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_maximal_cliques_hist, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_clique_number, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_weighted_cliques, [:pointer, :pointer, :pointer, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_largest_weighted_cliques, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_weighted_clique_number, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_independent_vertex_sets, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_largest_independent_vertex_sets, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_maximal_independent_vertex_sets, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_independence_number, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_random, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_circle, [:pointer, :pointer, IGRAPH_VS_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_star, [:pointer, :pointer, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_grid, [:pointer, :pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_grid_3d, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_fruchterman_reingold, [:pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_LAYOUT_GRID_T, :pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_kamada_kawai, [:pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_REAL_T, :pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_lgl, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_reingold_tilford, [:pointer, :pointer, IGRAPH_NEIMODE_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_reingold_tilford_circular, [:pointer, :pointer, IGRAPH_NEIMODE_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_roots_for_tree_layout, [:pointer, IGRAPH_NEIMODE_T, :pointer, IGRAPH_ROOT_CHOICE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_random_3d, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_sphere, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_fruchterman_reingold_3d, [:pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_kamada_kawai_3d, [:pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_REAL_T, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_graphopt, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_drl, [:pointer, :pointer, IGRAPH_BOOL_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_drl_3d, [:pointer, :pointer, IGRAPH_BOOL_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_merge_dla, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_sugiyama, [:pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_mds, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_bipartite, [:pointer, :pointer, :pointer, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_gem, [:pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_REAL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_davidson_harel, [:pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_REAL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_umap, [:pointer, :pointer, IGRAPH_BOOL_T, :pointer, IGRAPH_REAL_T, IGRAPH_INTEGER_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_umap_3d, [:pointer, :pointer, IGRAPH_BOOL_T, :pointer, IGRAPH_REAL_T, IGRAPH_INTEGER_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_layout_umap_compute_weights, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_cocitation, [:pointer, :pointer, IGRAPH_VS_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_bibcoupling, [:pointer, :pointer, IGRAPH_VS_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_similarity_dice, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_similarity_dice_es, [:pointer, :pointer, IGRAPH_ES_T, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_similarity_dice_pairs, [:pointer, :pointer, :pointer, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_similarity_inverse_log_weighted, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_similarity_jaccard, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_similarity_jaccard_es, [:pointer, :pointer, IGRAPH_ES_T, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_similarity_jaccard_pairs, [:pointer, :pointer, :pointer, IGRAPH_NEIMODE_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_compare_communities, [:pointer, :pointer, :pointer, IGRAPH_COMMUNITY_COMPARISON_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_spinglass, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_SPINCOMM_UPDATE_T, IGRAPH_REAL_T, IGRAPH_SPINGLASS_IMPLEMENTATION_T, IGRAPH_REAL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_spinglass_single, [:pointer, :pointer, IGRAPH_INTEGER_T, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_SPINCOMM_UPDATE_T, IGRAPH_REAL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_walktrap, [:pointer, :pointer, IGRAPH_INTEGER_T, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_edge_betweenness, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_eb_get_merges, [:pointer, IGRAPH_BOOL_T, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_fastgreedy, [:pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_to_membership, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_le_community_to_membership, [:pointer, IGRAPH_INTEGER_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_modularity, [:pointer, :pointer, :pointer, IGRAPH_REAL_T, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_modularity_matrix, [:pointer, :pointer, IGRAPH_REAL_T, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_reindex_membership, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_leading_eigenvector, [:pointer, :pointer, :pointer, :pointer, IGRAPH_INTEGER_T, :pointer, :pointer, IGRAPH_BOOL_T, :pointer, :pointer, :pointer, IGRAPH_COMMUNITY_LEADING_EIGENVECTOR_CALLBACK_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_fluid_communities, [:pointer, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_label_propagation, [:pointer, :pointer, IGRAPH_NEIMODE_T, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_multilevel, [:pointer, :pointer, IGRAPH_REAL_T, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_optimal_modularity, [:pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_leiden, [:pointer, :pointer, :pointer, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_BOOL_T, IGRAPH_INTEGER_T, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_split_join_distance, [:pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_infomap, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_community_voronoi, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_NEIMODE_T, IGRAPH_REAL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_graphlets, [:pointer, :pointer, :pointer, :pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_graphlets_candidate_basis, [:pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_graphlets_project, [:pointer, :pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_hrg_fit, [:pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_hrg_sample, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_hrg_sample_many, [:pointer, :pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_hrg_game, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_hrg_consensus, [:pointer, :pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_hrg_predict, [:pointer, :pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_hrg_create, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_hrg_resize, [:pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_hrg_size, [:pointer], IGRAPH_INTEGER_T

  attach_function :igraph_from_hrg_dendrogram, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_adjacency, [:pointer, :pointer, IGRAPH_GET_ADJACENCY_T, :pointer, IGRAPH_LOOPS_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_adjacency_sparse, [:pointer, :pointer, IGRAPH_GET_ADJACENCY_T, :pointer, IGRAPH_LOOPS_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_edgelist, [:pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_stochastic, [:pointer, :pointer, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_stochastic_sparse, [:pointer, :pointer, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_to_directed, [:pointer, IGRAPH_TO_DIRECTED_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_to_undirected, [:pointer, IGRAPH_TO_UNDIRECTED_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_read_graph_edgelist, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_read_graph_ncol, [:pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_ADD_WEIGHTS_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_read_graph_lgl, [:pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_ADD_WEIGHTS_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_read_graph_pajek, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_read_graph_graphml, [:pointer, :pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_read_graph_dimacs_flow, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_read_graph_graphdb, [:pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_read_graph_gml, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_read_graph_dl, [:pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_write_graph_edgelist, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_write_graph_ncol, [:pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_write_graph_lgl, [:pointer, :pointer, :pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_write_graph_leda, [:pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_write_graph_graphml, [:pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_write_graph_pajek, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_write_graph_dimacs_flow, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_write_graph_gml, [:pointer, :pointer, IGRAPH_WRITE_GML_SW_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_write_graph_dot, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_motifs_randesu, [:pointer, :pointer, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_motifs_randesu_estimate, [:pointer, :pointer, IGRAPH_INTEGER_T, :pointer, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_motifs_randesu_no, [:pointer, :pointer, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_dyad_census, [:pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_triad_census, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_adjacent_triangles, [:pointer, :pointer, IGRAPH_VS_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_local_scan_0, [:pointer, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_local_scan_0_them, [:pointer, :pointer, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_local_scan_1_ecount, [:pointer, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_local_scan_1_ecount_them, [:pointer, :pointer, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_local_scan_k_ecount, [:pointer, IGRAPH_INTEGER_T, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_local_scan_k_ecount_them, [:pointer, :pointer, IGRAPH_INTEGER_T, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_local_scan_neighborhood_ecount, [:pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_local_scan_subset_ecount, [:pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_list_triangles, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_disjoint_union, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_disjoint_union_many, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_join, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_union, [:pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_union_many, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_intersection, [:pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_intersection_many, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_difference, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_complementer, [:pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_compose, [:pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_induced_subgraph_map, [:pointer, :pointer, IGRAPH_VS_T, IGRAPH_SUBGRAPH_IMPLEMENTATION_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_gomory_hu_tree, [:pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_maxflow, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_maxflow_value, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_mincut, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_mincut_value, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_residual_graph, [:pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_reverse_residual_graph, [:pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_st_mincut, [:pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_st_mincut_value, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_st_vertex_connectivity, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_VCONN_NEI_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_vertex_connectivity, [:pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_st_edge_connectivity, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_edge_connectivity, [:pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_edge_disjoint_paths, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_vertex_disjoint_paths, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_adhesion, [:pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_cohesion, [:pointer, :pointer, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_dominator_tree, [:pointer, IGRAPH_INTEGER_T, :pointer, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_all_st_cuts, [:pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_all_st_mincuts, [:pointer, :pointer, :pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_even_tarjan_reduction, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_separator, [:pointer, IGRAPH_VS_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_minimal_separator, [:pointer, IGRAPH_VS_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_all_minimal_st_separators, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_minimum_size_separators, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_cohesive_blocks, [:pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_coreness, [:pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_isoclass, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_isomorphic, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_isoclass_subgraph, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_isoclass_create, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_isomorphic_vf2, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_ISOCOMPAT_T, IGRAPH_ISOCOMPAT_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_count_isomorphisms_vf2, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_ISOCOMPAT_T, IGRAPH_ISOCOMPAT_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_isomorphisms_vf2, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_ISOCOMPAT_T, IGRAPH_ISOCOMPAT_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_subisomorphic, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_subisomorphic_vf2, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_ISOCOMPAT_T, IGRAPH_ISOCOMPAT_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_subisomorphisms_vf2_callback, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_ISOHANDLER_T, IGRAPH_ISOCOMPAT_T, IGRAPH_ISOCOMPAT_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_count_subisomorphisms_vf2, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_ISOCOMPAT_T, IGRAPH_ISOCOMPAT_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_get_subisomorphisms_vf2, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_ISOCOMPAT_T, IGRAPH_ISOCOMPAT_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_canonical_permutation, [:pointer, :pointer, :pointer, IGRAPH_BLISS_SH_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_permute_vertices, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_isomorphic_bliss, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_BLISS_SH_T, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_count_automorphisms, [:pointer, :pointer, IGRAPH_BLISS_SH_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_automorphism_group, [:pointer, :pointer, :pointer, IGRAPH_BLISS_SH_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_subisomorphic_lad, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_BOOL_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_simplify_and_colorize, [:pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_graph_count, [IGRAPH_INTEGER_T, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_matching, [:pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_maximal_matching, [:pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_maximum_bipartite_matching, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, IGRAPH_REAL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_adjacency_spectral_embedding, [:pointer, IGRAPH_INTEGER_T, :pointer, IGRAPH_EIGEN_WHICH_POSITION_T, IGRAPH_BOOL_T, :pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_laplacian_spectral_embedding, [:pointer, IGRAPH_INTEGER_T, :pointer, IGRAPH_EIGEN_WHICH_POSITION_T, IGRAPH_LAPLACIAN_SPECTRAL_EMBEDDING_TYPE_T, IGRAPH_BOOL_T, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_eigen_adjacency, [:pointer, IGRAPH_EIGEN_ALGORITHM_T, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_power_law_fit, [:pointer, :pointer, IGRAPH_REAL_T, IGRAPH_BOOL_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_sir, [:pointer, IGRAPH_REAL_T, IGRAPH_REAL_T, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_running_mean, [:pointer, :pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_random_sample, [:pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_convex_hull, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_dim_select, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_almost_equals, [:double, :double, :double], IGRAPH_BOOL_T

  attach_function :igraph_cmp_epsilon, [:double, :double, :double], :int

  attach_function :igraph_eigen_matrix, [:pointer, :pointer, IGRAPH_ARPACK_FUNCTION_T, :int, :pointer, IGRAPH_EIGEN_ALGORITHM_T, :pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_eigen_matrix_symmetric, [:pointer, :pointer, IGRAPH_ARPACK_FUNCTION_T, :int, :pointer, IGRAPH_EIGEN_ALGORITHM_T, :pointer, :pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_solve_lsap, [:pointer, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_eulerian, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_eulerian_path, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_eulerian_cycle, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_fundamental_cycles, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_INTEGER_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_minimum_cycle_basis, [:pointer, :pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_BOOL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_tree, [:pointer, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_forest, [:pointer, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_from_prufer, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_to_prufer, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_tree_from_parent_vector, [:pointer, :pointer, IGRAPH_TREE_MODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_is_complete, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_minimum_spanning_tree, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_minimum_spanning_tree_unweighted, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_minimum_spanning_tree_prim, [:pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_random_spanning_tree, [:pointer, :pointer, IGRAPH_INTEGER_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_tree_game, [:pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, IGRAPH_RANDOM_TREE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_vertex_coloring_greedy, [:pointer, :pointer, IGRAPH_COLORING_GREEDY_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_deterministic_optimal_imitation, [:pointer, IGRAPH_INTEGER_T, IGRAPH_OPTIMAL_T, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_moran_process, [:pointer, :pointer, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_roulette_wheel_imitation, [:pointer, IGRAPH_INTEGER_T, IGRAPH_BOOL_T, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_stochastic_imitation, [:pointer, IGRAPH_INTEGER_T, IGRAPH_IMITATE_ALGORITHM_T, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_convergence_degree, [:pointer, :pointer, :pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_has_attribute_table, [], IGRAPH_BOOL_T

  attach_function :igraph_progress, [:pointer, IGRAPH_REAL_T, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_status, [:pointer, :pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_strerror, [IGRAPH_ERROR_T], :pointer

  attach_function :igraph_expand_path_to_pairs, [:pointer], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_invalidate_cache, [:pointer], :void

  attach_function :igraph_vertex_path_from_edge_path, [:pointer, IGRAPH_INTEGER_T, :pointer, :pointer, IGRAPH_NEIMODE_T], HANDLE_IGRAPH_ERROR_T

  attach_function :igraph_version, [:pointer, :pointer, :pointer, :pointer], :void
end
