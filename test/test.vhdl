-- A collection of entity and components to test the VEP plugin
-- v 1.2.0
-- dec. 12 2010
-- LGPLv3

	  component a_a is port (
	      DATA     : in std_logic_vector (31 downto 0); -- comment comment comment
      CLK        : in  std_logic;   -- comment comment comment
      	RST_SRn    : in  std_logic;   -- comment comment comment
	DELAY_RSTn : out std_logic    -- comment comment comment
    );
  end component a_a;

   

	  component a_b is PORT (
	      DATA     : in std_logic_vector (31 downto 0); -- comment comment comment
      CLK        : in  std_logic;   -- comment comment comment
      	RST_SRn    : in  std_logic;   -- comment comment comment
	DELAY_RSTn : out std_logic);
  end component a_b;



	  component a_c is port (
	      DATA     : in std_logic_vector (31 downto 0); -- comment comment comment
      CLK        : in  std_logic;   -- comment comment comment
      	RST_SRn    : in  std_logic;   -- comment comment comment
	DELAY_RSTn : out std_logic );
  end component a_c;



  component b_a is
    port (
      INPUT  : in  std_logic; -- comment comment comment
      SEL    : in  std_logic; -- comment comment comment
      OUTPUT : out std_logic_vector (15 downto 0)
    );
  end component b_a;



  component b_b is
    port (
      INPUT: in  std_logic; -- comment comment comment
      SEL: in  std_logic; -- comment comment comment
      OUTPUT: out std_logic_vector (15 downto 0));
  end component b_b;



  component b_c is
    port (
      INPUT  : in  std_logic; -- comment comment comment
      SEL    : in  std_logic; -- comment comment comment
      OUTPUT : out std_logic_vector (15 downto 0) );
  end component b_c;



  component b_e is
    port(
      INPUT  : in  std_logic; -- comment comment comment
      SEL    : in  std_logic; -- comment comment comment
      OUTPUT : out std_logic  -- comment comment comment
    );
  end component b_e;



  component b_d is port(
      INPUT  : in  std_logic; -- comment comment comment
      SEL    : in  std_logic; -- comment comment comment
      OUTPUT : out std_logic  -- comment comment comment
    );
  end component b_d;



  entity c_a is
    generic (g_WIDTH : positive := 4);
    port (
      DATA  : in std_logic_vector (31 downto 0);  -- comment comment comment
      CLK     : in  std_logic; -- comment comment comment
      RST_SRn : in  std_logic; -- comment comment comment
      CLK : out std_logic  -- comment comment comment
    );
  end entity c_a;



  ENTITY c_b is
    generic (
      g_WIDTH : positive := 4
    );
    port (
      DATA  : in std_logic_vector (31 downto 0);  -- comment comment comment
      CLK     : in  std_logic; -- comment comment comment
      RST_SRn : in  std_logic; -- comment comment comment
      CLK : out std_logic  -- comment comment comment
    );
  end entity c_b;



  entity c_c is
    generic (
      g_WIDTH : positive := 4);
    port (
      DATA  : in std_logic_vector (31 downto 0);  -- comment comment comment
      CLK     : in  std_logic; -- comment comment comment
      RST_SRn : in  std_logic; -- comment comment comment
      CLK : out std_logic  -- comment comment comment
    );
  end entity c_c;



  entity c_d is
    generic (
      g_WIDTH : positive := 4);
    port (
      DATA  : in std_logic_vector (31 downto 0);  -- comment comment comment
      CLK     : in  std_logic; -- comment comment comment
      RST_SRn : in  std_logic; -- comment comment comment
      CLK : out std_logic);
  end entity c_d;


  component e_a is
    generic (
      g_WIDTH : positive := 4);
    port (
      DATA  : in std_logic_vector (31 downto 0);  -- comment comment comment
      -- comment
      CLK     : in  std_logic; -- comment comment comment
      RST_SRn : in  std_logic; -- comment comment comment
      CLK : out std_logic);
  end component e_a;


  component e_b is
    generic (
      g_WIDTH : positive := 4);
    port (
      DATA  : in std_logic_vector (31 downto 0);  -- comment comment comment
      -- comment
      --comment
      CLK     : in  std_logic; -- comment comment comment
      RST_SRn : in  std_logic; -- comment comment comment
      CLK : out std_logic);
  end component e_b;


  component e_c is
    generic (
      -- comment
      --comment
      g_WIDTH : positive := 4);
    port (
      --comment
      DATA  : in std_logic_vector (31 downto 0);  -- comment comment comment
      -- comment
      -----------------------
      CLK     : in  std_logic; -- comment comment comment
      RST_SRn : in  std_logic; -- comment comment comment
      CLK : out std_logic);
  end component e_c;


  entity e_d is
    generic (
      -- comment
      --comment
      g_WIDTH : positive := 4); port (
      --comment
      DATA  : in std_logic_vector (31 downto 0);  -- comment comment comment
      -- comment
      --comment
      CLK     : in  std_logic; -- comment comment comment
      RST_SRn : in  std_logic; -- comment comment comment
      CLK : out std_logic);
  end entity e_d;


  component e_e is
    generic (
      -- comment
      --comment
      );
    port (
      --comment
      -- comment
      --comment
      );
  end component e_e;


  entity e_f is
    generic ( );
    port ( );
  end entity e_f;


  entity e_g is
    generic
    (
      -- comment
      --comment
      g_WIDTH : positive := 4
    );
    port 
    (
      --comment
      DATA  : in std_logic_vector (31 downto 0);  -- comment comment comment
      -- comment
      -----------------------
      CLK     : in  std_logic; -- comment comment comment
      RST_SRn : in  std_logic; -- comment comment comment
      CLK : out std_logic (31 downto 0)
    );
  end entity e_g;


  entity e_h is
    generic
      (g_WIDTH : positive := 4);
    port 
    (DATA  : in std_logic_vector (31 downto 0);  -- comment comment comment
      CLK     : in  std_logic; -- comment comment comment
      RST_SRn : in  std_logic; -- comment comment comment
      CLK : out std_logic (31 downto 0)
    );
  end entity e_g;


  component ADD
   generic (
  N : positive range 0 to 16);
   port (
  A: in std_logic_vector(N-1 downto 0);
  B: in std_logic_vector(N-1 downto 0);
  S: out std_logic_vector(N-1 downto 0));
  end component;


     component AND2
           generic (DELAY: time :=5ns);
           port (
             in1: in std_logic;
             out1: out std_logic);
     end component;


  entity reg32 is
     generic (
               setup_time : time := 50 ps;
               pulse_width : time := 100 ps  );
     port (
            input : in std_logic_vector(31 downto 0);
            output: out std_logic_vector(31 downto 0);
            Load  : in  std_logic_vector;
            Clk   : in  std_logic_vector );
  end entity reg32;


  component reg32 is
     generic ( 	   
               setup_time : time := 50 ps;
               setup_ti : time := 50 ps;
               setup : time := 50 ps;
               pulse_width : time := 100 ps  );
     port ( 	   
            input : in std_logic_vector(31 downto 0);
            output: out std_logic_vector(31 downto 0);
            Load  : in  std_logic_vector;
            Clk   : in  std_logic_vector );
  end component reg32;

  
  entity reg32 is
     generic ( setup_time : time := 50 ps;
               pulse_width : time := 100 ps  );
     port ( input : in std_logic_vector(31 downto 0);
            output: out std_logic_vector(31 downto 0);
            Load  : in  std_logic_vector;
            Clk   : in  std_logic_vector );
  end entity reg32;


  component foo
    port (
           a, b: in bit;
	  c: out bit);
  end component;


  component foo
    port (
           a,b: in bit;
	  c: out bit);
  end component;


  component foo
    port (a,b: in bit;
	  c: out bit);
  end component;


  component foo
    port ( a,b: in bit;
	  c: out bit );
  end component;


  component foo
    port ( a_port,b.toto: in bit;
	  c: out bit );
  end component;


  component foo
    port 	    (
           a, 	    b: in bit;
	  c: out bit 	   );
  end component;

  
  component foo
        generic ( a_port,b.toto: in bit;
	  c: out bit );
    port ( a_port,b.toto: in bit;
	  c: out bit );
  end component;

  

ENTITY and2 is
      GENERIC (trise : time := 10 ns;
            tfall : time := 8 ns);
      PORT( a : IN std_ulogic;
            b : IN std_ulogic;
            c : OUT std_ulogic);
END and2;


ENTITY and2 is
      GENERIC(trise : time := 10 ns;
            tfall : time := 8 ns);
      PORT(a : IN std_ulogic;
            b : IN std_ulogic;
            c : OUT std_ulogic);
END and2;


entity clock_cnt is
 port(
  clock: in std_logic;
  reset: in std_logic;
  num_clk: in integer range 0 to 15;
  clk_out: out std_logic
  );
end clock_cnt;


 component adder_n
 generic (N: integer := 8);
  port(a,b : in std_logic_vector(n-1 downto 0);
   cin : in std_logic;
   sum : out std_logic_vector(n-1 downto 0);
   cout : out std_logic);
 end component;


component bloc_arith is
generic(N: positive:=8);
port (A1,B1 : in std_logic_vector(N-1 downto 0);
SEL1 : in std_logic_vector(1 downto 0);
CI1 : in std_logic;
AO1 : out std_logic_vector(N-1 downto 0));
end component;


Entity piso is generic (width, wdth : time:=8); port(clk,load1,in1,o1 : std); end component;


Entity piso is generic (width, wdth : time :=8); 
  port(clk,load1,in1,o1 : std);
end component;


---------------------------------------------------------------------------------
-- Instances
---------------------------------------------------------------------------------


  U0_7_u_10 : d_a port map (
    DATA     => s_DATA,     -- comment comment comment
    CLK        => s_CLK,        -- comment comment comment
    RST_SRn    => s_RST_SRn,    -- comment comment comment
    DELAY      => s_DELAY       -- comment comment comment
  );


  U1 : d_b
  port map (
    DATA     => s_DATA,     -- comment comment comment
    CLK        => s_CLK,        -- comment comment comment
    RST_SRn    => s_RST_SRn,    -- comment comment comment
    DELAY      => s_DELAY       -- comment comment comment
  );


  U2 : d_c port map (
    DATA       => s_DATA,     -- comment comment comment
    CLK        => s_CLK,        -- comment comment comment
    RST_SRn    => s_RST_SRn,    -- comment comment comment
    DELAY      => s_DELAY);


  U3 : e_a
  generic map (g_WIDTH=>14)   -- comment comment comment
  port map (
    DATA=>s_DATA,         -- comment comment comment
    CLK=>s_CLK,           -- comment comment comment
    RST_SRn=>s_RSTn,          -- comment comment comment
    CLK=>s_CLKOUT0(0)     -- comment comment comment
  );


  U4 : e_b
  GENERIC MAP (g_WIDTH => 14)   -- comment comment comment
  port map (
    DATA    => s_DATA,         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment
    RST_SRn => s_RSTn,          -- comment comment comment
    CLK     => s_CLKOUT0(0));


  U5 : e_c
  generic map (g_WIDTH => 14)   -- comment comment comment
  PORT MAP (
    DATA    => s_DATA,         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment
    RST_SRn => s_RSTn,          -- comment comment comment
    CLK (15 downto 0) => s_CLKOUT0 (15 downto 0));


  U6 : e_d
  generic map (
    g_WIDTH => 14   -- comment comment comment
  )
  PORT map (
    DATA  => s_DATA,         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment
    RST_SRn => s_RSTn,          -- comment comment comment
    CLK => s_CLKOUT0(0)     -- comment comment comment
  );


  U7 : e_e
  generic
    MAP (
      g_WIDTH => 14   -- comment comment comment
    )
  port map (
    DATA    => s_DATA,         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment
    RST_SRn => s_RSTn,          -- comment comment comment
    CLK     => s_CLKOUT0(0)     -- comment comment comment
  );


  U8 : e_f
  generic
    map (
      g_WIDTH => 14   -- comment comment comment
    )
  port
    map (
      DATA    => s_DATA,         -- comment comment comment
      CLK     => s_CLK,           -- comment comment comment
      RST_SRn => s_RSTn,          -- comment comment comment
      CLK => s_CLKOUT0(0)     -- comment comment comment
    );


  U9 : e_g generic map (g_WIDTH => 14)   -- comment comment comment
  port map (
    DATA    => s_DATA,         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment
    RST_SRn => s_RSTn,          -- comment comment comment
    CLK => s_CLKOUT0(0)     -- comment comment comment
  );


  U10 : e_k generic
  map (g_WIDTH => 14)   -- comment comment comment
  port map (
    DATA    => s_DATA,         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment
    RST_SRn => s_RSTn,          -- comment comment comment
    CLK => s_CLKOUT0(0)     -- comment comment comment
  );


  U11 : e_j generic
  map(g_WIDTH => 14)   -- comment comment comment
  port map(
    DATA    => s_DATA,         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment
    RST_SRn => s_RSTn,          -- comment comment comment
    CLK => s_CLKOUT0(0)     -- comment comment comment
  );


reg1:reg_nb
GENERIC MAP(length=>7) PORT MAP(reg_in=>r_in,clk=>clk,rst=>rst,reg_out=>r_out) ;

---------------------------------------------------------------------------------
-- Bad Instances
--------------------------------------------------------------------------------

  U12 : e_l generic
  map (g_WIDTH => 14)   -- comment comment comment
  port map (
    DATA    => s_DATA,         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment
    RST_SRn => s_RSTn,          -- comment comment comment
    CLK => s_CLKOUT0(0)     -- comment comment comment

  U13 : e_l generic
  map (g_WIDTH => 14)   -- comment comment comment
  port map (
    DATA    => s_DATA,         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment

    RST_SRn => s_RSTn,          -- comment comment comment
    CLK => s_CLKOUT0(0));     -- comment comment comment

  U14 : e_l generic
  map (g_WIDTH => 14   -- comment comment comment
  port map (
    DATA    => s_DATA,         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment

    RST_SRn => s_RSTn,          -- comment comment comment
    CLK => s_CLKOUT0(0));     -- comment comment comment

-- vim:set noexpandtab
