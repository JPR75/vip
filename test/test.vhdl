-- A collection of entity and components to test the VEP plugin
-- v 0.1.0
-- nov. 07 2010
-- LGPLv3

	  component a_a is port (
	      DATA     : in std_logic_vector (31 downto 0); -- comment comment comment
      CLK        : in  std_logic;   -- comment comment comment
      	RST_SRn    : in  std_logic;   -- comment comment comment
	DELAY_RSTn : out std_logic    -- comment comment comment
    );
  end component a_a;



	  component a_b is port (
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
      INPUT  : in  std_logic; -- comment comment comment
      SEL    : in  std_logic; -- comment comment comment
      OUTPUT : out std_logic_vector (15 downto 0));
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



  component b_c is port(
      INPUT  : in  std_logic; -- comment comment comment
      SEL    : in  std_logic; -- comment comment comment
      OUTPUT : out std_logic  -- comment comment comment
    );
  end component b_c;



  component c_a is
    generic (g_WIDTH : positive := 4);
    port (
      DATA  : in std_logic_vector (31 downto 0);  -- comment comment comment
      CLK     : in  std_logic; -- comment comment comment
      RST_SRn : in  std_logic; -- comment comment comment
      CLK : out std_logic  -- comment comment comment
    );
  end component c_a;



  component c_b is
    generic (
      g_WIDTH : positive := 4
    );
    port (
      DATA  : in std_logic_vector (31 downto 0);  -- comment comment comment
      CLK     : in  std_logic; -- comment comment comment
      RST_SRn : in  std_logic; -- comment comment comment
      CLK : out std_logic  -- comment comment comment
    );
  end component c_b;



  component c_c is
    generic (
      g_WIDTH : positive := 4);
    port (
      DATA  : in std_logic_vector (31 downto 0);  -- comment comment comment
      CLK     : in  std_logic; -- comment comment comment
      RST_SRn : in  std_logic; -- comment comment comment
      CLK : out std_logic  -- comment comment comment
    );
  end component c_c;



  component c_d is
    generic (
      g_WIDTH : positive := 4);
    port (
      DATA  : in std_logic_vector (31 downto 0);  -- comment comment comment
      CLK     : in  std_logic; -- comment comment comment
      RST_SRn : in  std_logic; -- comment comment comment
      CLK : out std_logic);
  end component c_d;

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
  U0 : d_a port map (
    DATA     => s_DATA,     -- comment comment comment
    CLK        => s_CLK,        -- comment comment comment
    RST_SRn    => s_RST_SRn,    -- comment comment comment
    DELAY      => s_DELAY       -- comment comment comment
  );

  U1 : d_b port map (
    DATA       => s_DATA,     -- comment comment comment
    CLK        => s_CLK,        -- comment comment comment
    RST_SRn    => s_RST_SRn,    -- comment comment comment
    DELAY      => s_DELAY);

  U2 : e_a
  generic map (g_WIDTH => 14)   -- comment comment comment
  port map (
    DATA    => s_DATA         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment
    RST_SRn => s_RSTn,          -- comment comment comment
    CLK     => s_CLKOUT0(0)     -- comment comment comment
  );

  U3 : e_b
  generic map (g_WIDTH => 14)   -- comment comment comment
  port map (
    DATA    => s_DATA         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment
    RST_SRn => s_RSTn,          -- comment comment comment
    CLK     => s_CLKOUT0(0));

  U4 : e_c
  generic map (
    g_WIDTH => 14   -- comment comment comment
  )
  port map (
    DATA  => s_DATA         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment
    RST_SRn => s_RSTn,          -- comment comment comment
    CLK => s_CLKOUT0(0)     -- comment comment comment
  );

  U5 : e_d
  generic
    map (
      g_WIDTH => 14   -- comment comment comment
    )
  port map (
    DATA    => s_DATA         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment
    RST_SRn => s_RSTn,          -- comment comment comment
    CLK     => s_CLKOUT0(0)     -- comment comment comment
  );

  U6 : e_e
  generic
    map (
      g_WIDTH => 14   -- comment comment comment
    )
  port
    map (
      DATA    => s_DATA         -- comment comment comment
      CLK     => s_CLK,           -- comment comment comment
      RST_SRn => s_RSTn,          -- comment comment comment
      CLK => s_CLKOUT0(0)     -- comment comment comment
    );

  U7 : e_f generic map (g_WIDTH => 14)   -- comment comment comment
  port map (
    DATA    => s_DATA         -- comment comment comment
    CLK     => s_CLK,           -- comment comment comment
    RST_SRn => s_RSTn,          -- comment comment comment
    CLK => s_CLKOUT0(0)     -- comment comment comment
  );

-- vim:set noexpandtab
