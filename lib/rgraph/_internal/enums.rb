# Enums tests
# Ruby counterpart of an `igraph_attribute_elemtype_t` enum.
class AttributeElementType
  GRAPH = 0
  VERTEX = 1
  EDGE = 2

  SYMBOL_MAP = {
    graph: GRAPH,
    vertex: VERTEX,
    edge: EDGE,
  }
end
# Ruby counterpart of an `igraph_pagerank_algo_t` enum.
class PagerankAlgorithm
  ARPACK = 1
  PRPACK = 2

  SYMBOL_MAP = {
    arpack: ARPACK,
    prpack: PRPACK,
  }
end
# Ruby counterpart of an `igraph_coloring_greedy_t` enum.
class GreedyColoringHeuristics
  COLORED_NEIGHBORS = 0
  DSATUR = 1

  SYMBOL_MAP = {
    colored_neighbors: COLORED_NEIGHBORS,
    dsatur: DSATUR,
  }
end
# Ruby counterpart of an `igraph_optimal_t` enum.
class Optimality
  MINIMUM = 0
  MAXIMUM = 1

  SYMBOL_MAP = {
    minimum: MINIMUM,
    maximum: MAXIMUM,
  }
end
# Ruby counterpart of an `igraph_neimode_t` enum.
class NeighborMode
  OUT = 1
  IN = 2
  ALL = 3

  SYMBOL_MAP = {
    out: OUT,
    in: IN,
    all: ALL,
  }
end
# Ruby counterpart of an `igraph_adjacency_t` enum.
class AdjacencyMode
  DIRECTED = 0
  UNDIRECTED = 1
  UPPER = 2
  LOWER = 3
  MIN = 4
  PLUS = 5
  MAX = 6

  SYMBOL_MAP = {
    directed: DIRECTED,
    undirected: UNDIRECTED,
    upper: UPPER,
    lower: LOWER,
    min: MIN,
    plus: PLUS,
    max: MAX,
  }
end
# Ruby counterpart of an `igraph_erdos_renyi_t` enum.
class ErdosRenyiType
  GNP = 0
  GNM = 1

  SYMBOL_MAP = {
    gnp: GNP,
    gnm: GNM,
  }
end
# Ruby counterpart of an `igraph_degseq_t` enum.
class DegreeSequenceMode
  CONFIGURATION = 0
  VL = 1
  FAST_HEUR_SIMPLE = 2
  CONFIGURATION_SIMPLE = 3
  EDGE_SWITCHING_SIMPLE = 4

  SYMBOL_MAP = {
    configuration: CONFIGURATION,
    vl: VL,
    fast_heur_simple: FAST_HEUR_SIMPLE,
    configuration_simple: CONFIGURATION_SIMPLE,
    edge_switching_simple: EDGE_SWITCHING_SIMPLE,
  }
end
# Ruby counterpart of an `igraph_random_tree_t` enum.
class RandomTreeMethod
  PRUFER = 0
  LERW = 1

  SYMBOL_MAP = {
    prufer: PRUFER,
    lerw: LERW,
  }
end
# Ruby counterpart of an `igraph_fileformat_type_t` enum.
class FileFormat
  EDGELIST = 0
  NCOL = 1
  PAJEK = 2
  LGL = 3
  GRAPHML = 4

  SYMBOL_MAP = {
    edgelist: EDGELIST,
    ncol: NCOL,
    pajek: PAJEK,
    lgl: LGL,
    graphml: GRAPHML,
  }
end
# Ruby counterpart of an `igraph_edgeorder_type_t` enum.
class EdgeOrder
  ID = 0
  FROM = 1
  TO = 2

  SYMBOL_MAP = {
    id: ID,
    from: FROM,
    to: TO,
  }
end
# Ruby counterpart of an `igraph_spincomm_update_t` enum.
class SpinglassUpdateMode
  SIMPLE = 0
  CONFIG = 1

  SYMBOL_MAP = {
    simple: SIMPLE,
    config: CONFIG,
  }
end
# Ruby counterpart of an `igraph_lazy_adlist_simplify_t` enum.
class LazyAdjacencyListSimplify
  DONT_SIMPLIFY = 0
  SIMPLIFY = 1

  SYMBOL_MAP = {
    dont_simplify: DONT_SIMPLIFY,
    simplify: SIMPLIFY,
  }
end
# Ruby counterpart of an `igraph_fas_algorithm_t` enum.
class FeedbackArcSetAlgorithm
  EXACT_IP = 0
  APPROX_EADES = 1

  SYMBOL_MAP = {
    exact_ip: EXACT_IP,
    approx_eades: APPROX_EADES,
  }
end
# Ruby counterpart of an `igraph_error_type_t` enum.
class ErrorCode
  SUCCESS = 0
  FAILURE = 1
  ENOMEM = 2
  PARSEERROR = 3
  EINVAL = 4
  EXISTS = 5
  EINVEVECTOR = 6
  EINVVID = 7
  NONSQUARE = 8
  EINVMODE = 9
  EFILE = 10
  UNIMPLEMENTED = 12
  INTERRUPTED = 13
  DIVERGED = 14
  ARPACK_PROD = 15
  ARPACK_NPOS = 16
  ARPACK_NEVNPOS = 17
  ARPACK_NCVSMALL = 18
  ARPACK_NONPOSI = 19
  ARPACK_WHICHINV = 20
  ARPACK_BMATINV = 21
  ARPACK_WORKLSMALL = 22
  ARPACK_TRIDERR = 23
  ARPACK_ZEROSTART = 24
  ARPACK_MODEINV = 25
  ARPACK_MODEBMAT = 26
  ARPACK_ISHIFT = 27
  ARPACK_NEVBE = 28
  ARPACK_NOFACT = 29
  ARPACK_FAILED = 30
  ARPACK_HOWMNY = 31
  ARPACK_HOWMNYS = 32
  ARPACK_EVDIFF = 33
  ARPACK_SHUR = 34
  ARPACK_LAPACK = 35
  ARPACK_UNKNOWN = 36
  ENEGLOOP = 37
  EINTERNAL = 38
  ARPACK_MAXIT = 39
  ARPACK_NOSHIFT = 40
  ARPACK_REORDER = 41
  EDIVZERO = 42
  GLP_EBOUND = 43
  GLP_EROOT = 44
  GLP_ENOPFS = 45
  GLP_ENODFS = 46
  GLP_EFAIL = 47
  GLP_EMIPGAP = 48
  GLP_ETMLIM = 49
  GLP_ESTOP = 50
  EATTRIBUTES = 51
  EATTRCOMBINE = 52
  ELAPACK = 53
  EDRL = 54
  EOVERFLOW = 55
  EGLP = 56
  CPUTIME = 57
  EUNDERFLOW = 58
  ERWSTUCK = 59
  STOP = 60
  ERANGE = 61
  ENOSOL = 62

  SYMBOL_MAP = {
    success: SUCCESS,
    failure: FAILURE,
    enomem: ENOMEM,
    parseerror: PARSEERROR,
    einval: EINVAL,
    exists: EXISTS,
    einvevector: EINVEVECTOR,
    einvvid: EINVVID,
    nonsquare: NONSQUARE,
    einvmode: EINVMODE,
    efile: EFILE,
    unimplemented: UNIMPLEMENTED,
    interrupted: INTERRUPTED,
    diverged: DIVERGED,
    arpack_prod: ARPACK_PROD,
    arpack_npos: ARPACK_NPOS,
    arpack_nevnpos: ARPACK_NEVNPOS,
    arpack_ncvsmall: ARPACK_NCVSMALL,
    arpack_nonposi: ARPACK_NONPOSI,
    arpack_whichinv: ARPACK_WHICHINV,
    arpack_bmatinv: ARPACK_BMATINV,
    arpack_worklsmall: ARPACK_WORKLSMALL,
    arpack_triderr: ARPACK_TRIDERR,
    arpack_zerostart: ARPACK_ZEROSTART,
    arpack_modeinv: ARPACK_MODEINV,
    arpack_modebmat: ARPACK_MODEBMAT,
    arpack_ishift: ARPACK_ISHIFT,
    arpack_nevbe: ARPACK_NEVBE,
    arpack_nofact: ARPACK_NOFACT,
    arpack_failed: ARPACK_FAILED,
    arpack_howmny: ARPACK_HOWMNY,
    arpack_howmnys: ARPACK_HOWMNYS,
    arpack_evdiff: ARPACK_EVDIFF,
    arpack_shur: ARPACK_SHUR,
    arpack_lapack: ARPACK_LAPACK,
    arpack_unknown: ARPACK_UNKNOWN,
    enegloop: ENEGLOOP,
    einternal: EINTERNAL,
    arpack_maxit: ARPACK_MAXIT,
    arpack_noshift: ARPACK_NOSHIFT,
    arpack_reorder: ARPACK_REORDER,
    edivzero: EDIVZERO,
    glp_ebound: GLP_EBOUND,
    glp_eroot: GLP_EROOT,
    glp_enopfs: GLP_ENOPFS,
    glp_enodfs: GLP_ENODFS,
    glp_efail: GLP_EFAIL,
    glp_emipgap: GLP_EMIPGAP,
    glp_etmlim: GLP_ETMLIM,
    glp_estop: GLP_ESTOP,
    eattributes: EATTRIBUTES,
    eattrcombine: EATTRCOMBINE,
    elapack: ELAPACK,
    edrl: EDRL,
    eoverflow: EOVERFLOW,
    eglp: EGLP,
    cputime: CPUTIME,
    eunderflow: EUNDERFLOW,
    erwstuck: ERWSTUCK,
    stop: STOP,
    erange: ERANGE,
    enosol: ENOSOL,
  }
end
# Ruby counterpart of an `igraph_vs_type_t` enum.
class VertexSequenceType
  ALL = 0
  ADJ = 1
  NONE = 2
  ONE = 3
  VECTORPTR = 4
  VECTOR = 5
  RANGE = 6
  NONADJ = 7

  SYMBOL_MAP = {
    all: ALL,
    adj: ADJ,
    none: NONE,
    one: ONE,
    vectorptr: VECTORPTR,
    vector: VECTOR,
    range: RANGE,
    nonadj: NONADJ,
  }
end
# Ruby counterpart of an `igraph_vit_type_t` enum.
class VertexIteratorType
  RANGE = 0
  VECTOR = 1
  VECTORPTR = 2

  SYMBOL_MAP = {
    range: RANGE,
    vector: VECTOR,
    vectorptr: VECTORPTR,
  }
end
# Ruby counterpart of an `igraph_es_type_t` enum.
class EdgeSequenceType
  ALL = 0
  ALLFROM = 1
  ALLTO = 2
  INCIDENT = 3
  NONE = 4
  ONE = 5
  VECTORPTR = 6
  VECTOR = 7
  RANGE = 8
  PAIRS = 9
  PATH = 10
  UNUSED_WAS_MULTIPAIRS = 11
  ALL_BETWEEN = 12

  SYMBOL_MAP = {
    all: ALL,
    allfrom: ALLFROM,
    allto: ALLTO,
    incident: INCIDENT,
    none: NONE,
    one: ONE,
    vectorptr: VECTORPTR,
    vector: VECTOR,
    range: RANGE,
    pairs: PAIRS,
    path: PATH,
    unused_was_multipairs: UNUSED_WAS_MULTIPAIRS,
    all_between: ALL_BETWEEN,
  }
end
# Ruby counterpart of an `igraph_eit_type_t` enum.
class EdgeIteratorType
  RANGE = 0
  VECTOR = 1
  VECTORPTR = 2

  SYMBOL_MAP = {
    range: RANGE,
    vector: VECTOR,
    vectorptr: VECTORPTR,
  }
end
# Ruby counterpart of an `igraph_layout_drl_default_t` enum.
class DRLLayoutPreset
  DEFAULT = 0
  COARSEN = 1
  COARSEST = 2
  REFINE = 3
  FINAL = 4

  SYMBOL_MAP = {
    default: DEFAULT,
    coarsen: COARSEN,
    coarsest: COARSEST,
    refine: REFINE,
    final: FINAL,
  }
end
# Ruby counterpart of an `igraph_sparsemat_type_t` enum.
class SparseMatrixType
  TRIPLET = 0
  CC = 1

  SYMBOL_MAP = {
    triplet: TRIPLET,
    cc: CC,
  }
end
# Ruby counterpart of an `igraph_sparsemat_solve_t` enum.
class SparseMatrixSolver
  LU = 0
  QR = 1

  SYMBOL_MAP = {
    lu: LU,
    qr: QR,
  }
end
# Ruby counterpart of an `igraph_bliss_sh_t` enum.
class BLISSSplittingHeuristics
  F = 0
  FL = 1
  FS = 2
  FM = 3
  FLM = 4
  FSM = 5

  SYMBOL_MAP = {
    f: F,
    fl: FL,
    fs: FS,
    fm: FM,
    flm: FLM,
    fsm: FSM,
  }
end
