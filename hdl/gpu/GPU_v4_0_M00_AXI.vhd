library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Generated by: Vivado, Edited by: Matthew 
-- File generated from vivado new custom ip menu with changes to the example in order
-- to create a simple GPU to show sprites

entity GPU_v4_0_M00_AXI is
  generic (
    --  buffer addresses 
    bufferAddr       : std_logic_vector := x"40000000";
    bufferAddr2      : std_logic_vector := x"40000000";
    -- color that will enable the write strobe and cause the data to 
    -- not actually be written to the buffer 
    transparentColor : std_logic_vector := x"fffffff7";

    -- Thread ID Width
    C_M_AXI_ID_WIDTH     : integer := 1;
    -- Width of Address Bus
    C_M_AXI_ADDR_WIDTH   : integer := 32;
    -- Width of Data Bus
    C_M_AXI_DATA_WIDTH   : integer := 32;
    -- Width of User Write Address Bus
    C_M_AXI_AWUSER_WIDTH : integer := 0;
    -- Width of User Read Address Bus
    C_M_AXI_ARUSER_WIDTH : integer := 0;
    -- Width of User Write Data Bus
    C_M_AXI_WUSER_WIDTH  : integer := 0;
    -- Width of User Read Data Bus
    C_M_AXI_RUSER_WIDTH  : integer := 0;
    -- Width of User Response Bus
    C_M_AXI_BUSER_WIDTH  : integer := 0
    );
  port (
    spriteBaseAddr : in std_logic_vector(31 downto 0);
    x              : in std_logic_vector(31 downto 0);
    y              : in std_logic_vector(31 downto 0);
    spriteHeight   : in std_logic_vector(31 downto 0);
    spriteWidth    : in std_logic_vector(31 downto 0);
    switch_buffer  : in std_logic;

    -- Initiate AXI transactions
    INIT_AXI_TXN : in  std_logic;
    -- Asserts when transaction is complete
    TXN_DONE     : out std_logic;
    -- Asserts when ERROR is detected
    error        : out std_logic;
    -- 
    M_AXI_ACLK   : in  std_logic;

    -- Global Reset Singal. This Signal is Active Low
    M_AXI_ARESETN : in  std_logic;
    -- Master Interface Write Address ID
    M_AXI_AWID    : out std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    -- Master Interface Write Address
    M_AXI_AWADDR  : out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    -- Burst length. The burst length gives the exact number of transfers in a burst
    M_AXI_AWLEN   : out std_logic_vector(7 downto 0);
    -- Burst size. This signal indicates the size of each transfer in the burst
    M_AXI_AWSIZE  : out std_logic_vector(2 downto 0);
    -- Burst type. The burst type and the size information, 
    -- determine how the address for each transfer within the burst is calculated.
    M_AXI_AWBURST : out std_logic_vector(1 downto 0);
    -- Lock type. Provides additional information about the
    -- atomic characteristics of the transfer.
    M_AXI_AWLOCK  : out std_logic;
    -- Memory0000000D type. This signal indicates how transactions
    -- are required to progress through a system.
    M_AXI_AWCACHE : out std_logic_vector(3 downto 0);
    -- Protection type. This signal indicates the privilege
    -- and security level of the transaction, and whether
    -- the transaction is a data access or an instruction access.
    M_AXI_AWPROT  : out std_logic_vector(2 downto 0);
    -- Quality of Service, QoS identifier sent for each write transaction.
    M_AXI_AWQOS   : out std_logic_vector(3 downto 0);
    -- Optional User-defined signal in the write address channel.
    M_AXI_AWUSER  : out std_logic_vector(C_M_AXI_AWUSER_WIDTH-1 downto 0);
    -- Write address valid. This signal indicates that
    -- the channel is signaling valid write address and control information.
    M_AXI_AWVALID : out std_logic;
    -- Write address ready. This signal indicates that
    -- the slave is ready to accept an address and associated control signals
    M_AXI_AWREADY : in  std_logic;
    -- Master Interface Write Data.
    M_AXI_WDATA   : out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
    -- Write strobes. This signal indicates which byte
    -- lanes hold valid data. There is one write strobe
    -- bit for each eight bits of the write data bus.
    M_AXI_WSTRB   : out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0);
    -- Write last. This signal indicates the last transfer in a write burst.
    M_AXI_WLAST   : out std_logic;
    -- Optional User-defined signal in the write data channel.
    M_AXI_WUSER   : out std_logic_vector(C_M_AXI_WUSER_WIDTH-1 downto 0);
    -- Write valid. This signal indicates that valid write
    -- data and strobes are available
    M_AXI_WVALID  : out std_logic;
    -- Write ready. This signal indicates that the slave
    -- can accept the write data.
    M_AXI_WREADY  : in  std_logic;
    -- Master Interface Write Response.
    M_AXI_BID     : in  std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    -- Write response. This signal indicates the status of the write transaction.
    M_AXI_BRESP   : in  std_logic_vector(1 downto 0);
    -- Optional User-defined signal in the write response channel
    M_AXI_BUSER   : in  std_logic_vector(C_M_AXI_BUSER_WIDTH-1 downto 0);
    -- Write response valid. This signal indicates that the
    -- channel is signaling a valid write response.
    M_AXI_BVALID  : in  std_logic;
    -- Response ready. This signal indicates that the master
    -- can accept a write response.
    M_AXI_BREADY  : out std_logic;
    -- Master Interface Read Address.
    M_AXI_ARID    : out std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    -- Read address. This signal indicates the initial
    -- address of a read burst transaction.
    M_AXI_ARADDR  : out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    -- Burst length. The burst length gives the exact number of transfers in a burst
    M_AXI_ARLEN   : out std_logic_vector(7 downto 0);
    -- Burst size. This signal indicates the size of each transfer in the burst
    M_AXI_ARSIZE  : out std_logic_vector(2 downto 0);
    -- Burst type. The burst type and the size information, 
    -- determine how the address for each transfer within the burst is calculated.
    M_AXI_ARBURST : out std_logic_vector(1 downto 0);
    -- Lock type. Provides additional information about the
    -- atomic characteristics of the transfer.
    M_AXI_ARLOCK  : out std_logic;
    -- Memory type. This signal indicates how transactions
    -- are required to progress through a system.
    M_AXI_ARCACHE : out std_logic_vector(3 downto 0);
    -- Protection type. This signal indicates the privilege
    -- and security level of the transaction, and whether
    -- the transaction is a data access or an instruction access.
    M_AXI_ARPROT  : out std_logic_vector(2 downto 0);
    -- Quality of Service, QoS identifier sent for each read transaction
    M_AXI_ARQOS   : out std_logic_vector(3 downto 0);
    -- Optional User-defined signal in the read address channel.
    M_AXI_ARUSER  : out std_logic_vector(C_M_AXI_ARUSER_WIDTH-1 downto 0);
    -- Write address valid. This signal indicates that
    -- the channel is signaling valid read address and control information
    M_AXI_ARVALID : out std_logic;
    -- Read address ready. This signal indicates that
    -- the slave is ready to accept an address and associated control signals
    M_AXI_ARREADY : in  std_logic;
    -- Read ID tag. This signal is the identification tag
    -- for the read data group of signals generated by the slave.
    M_AXI_RID     : in  std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
    -- Master Read Data
    M_AXI_RDATA   : in  std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
    -- Read response. This signal indicates the status of the read transfer
    M_AXI_RRESP   : in  std_logic_vector(1 downto 0);
    -- Read last. This signal indicates the last transfer in a read burst
    M_AXI_RLAST   : in  std_logic;
    -- Optional User-defined signal in the read address channel.
    M_AXI_RUSER   : in  std_logic_vector(C_M_AXI_RUSER_WIDTH-1 downto 0);
    -- Read valid. This signal indicates that the channel
    -- is signaling the required read data.
    M_AXI_RVALID  : in  std_logic;
    -- Read ready. This signal indicates that the master can
    -- accept the read data and response information.
    M_AXI_RREADY  : out std_logic
    );
end GPU_v4_0_M00_AXI;

architecture implementation of GPU_v4_0_M00_AXI is

  -- function called clogb2 that returns an integer which has the
  --value of the ceiling of the log base 2

  function clogb2 (bit_depth : integer) return integer is
    variable depth : integer := bit_depth;
    variable count : integer := 1;
  begin
    for clogb2 in 1 to bit_depth loop
      if (bit_depth <= 2) then
        count := 1;
      else
        if(depth <= 1) then
          count := count;
        else
          depth := depth / 2;
          count := count + 1;
        end if;
      end if;
    end loop;
    return(count);
  end;

  constant C_M_AXI_BURST_LEN : integer := 256;

  -- C_TRANSACTIONS_NUM is the width of the index counter for
  -- number of beats in a burst write or burst read transaction.
  constant C_TRANSACTIONS_NUM : integer := clogb2(C_M_AXI_BURST_LEN-1);
  -- only do one burst until the sprite is done 
  constant C_NO_BURSTS_REQ    : integer := 0;  
  type state is (
    IDLE,        -- idle until next sprite request 
    SETUP,       -- setup next burst of sprite data
    INIT_WRITE,  -- write sprite to buffer 
    INIT_READ);  -- read sprite data from memory 


  signal mst_exec_state : state;


  -- used for switch buffer logic 
  signal currBuffAddr  : std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
  signal bufferUpdated : std_logic;

  -- AXI4FULL signals
  signal axi_awaddr               : std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
  signal axi_awvalid              : std_logic;
  signal axi_wdata                : std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
  signal axi_interdata            : std_logic_vector(4*C_M_AXI_DATA_WIDTH-1 downto 0);
  signal axi_wlast                : std_logic;
  signal axi_wvalid               : std_logic;
  signal axi_bready               : std_logic;
  signal axi_araddr               : std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
  signal axi_arvalid              : std_logic;
  signal axi_rready               : std_logic;
  --write beat count in a burst
  signal write_index              : std_logic_vector(C_TRANSACTIONS_NUM downto 0);
  --read beat count in a burst
  signal read_index               : std_logic_vector(C_TRANSACTIONS_NUM downto 0);
  --size of C_M_AXI_BURST_LEN length burst in bytes
  signal burst_size_bytes         : std_logic_vector(C_TRANSACTIONS_NUM+2 downto 0);
  --The burst counters are used to track the number of burst transfers of C_M_AXI_BURST_LEN burst length needed to transfer 2^C_MASTER_LENGTH bytes of data.
  signal write_burst_counter      : std_logic_vector(C_NO_BURSTS_REQ downto 0);
  signal read_burst_counter       : std_logic_vector(C_NO_BURSTS_REQ downto 0);
  signal start_single_burst_write : std_logic;
  signal start_single_burst_read  : std_logic;
  signal writes_done              : std_logic;
  signal reads_done               : std_logic;
  signal error_reg                : std_logic;
  signal compare_done             : std_logic;
  signal read_mismatch            : std_logic;
  signal burst_write_active       : std_logic;
  signal burst_read_active        : std_logic;
  signal expected_rdata           : std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
  --Interface response error flags
  signal write_resp_error         : std_logic;
  signal read_resp_error          : std_logic;
  signal wnext                    : std_logic;
  signal rnext                    : std_logic;
  signal init_txn_ff              : std_logic;
  signal init_txn_ff2             : std_logic;
  signal init_txn_edge            : std_logic;
  signal init_txn_pulse           : std_logic;

  -- storage for the current burst of sprite data between the read and the write 
  type internalData is array(0 to C_M_AXI_BURST_LEN-1) of std_logic_vector(32-1 downto 0);
  signal spriteData : internalData;

  -- set high when teh sprite is done 
  signal spriteDone : std_logic;

  -- current offset into the sprite 
  signal xOffset : std_logic_vector(31 downto 0);
  signal yOffset : std_logic_vector(31 downto 0);

  -- actual burst length to use if the sprite is not a full buffer clear 
  signal actualBurstLen : integer := 32;

  signal start : std_logic;
begin
  --I/O Connections. Write Address (AW)
  M_AXI_AWID       <= (others => '0');
  --The AXI address is a concatenation of the target base address + active offset range
  M_AXI_AWADDR     <= std_logic_vector(unsigned(currBuffAddr) + unsigned(axi_awaddr));
  --Burst LENgth is number of transaction beats, minus 1
  M_AXI_AWLEN      <= std_logic_vector(to_unsigned(actualBurstLen - 1, 8));
  --Size should be C_M_AXI_DATA_WIDTH, in 2^SIZE bytes, otherwise narrow bursts are used
  M_AXI_AWSIZE     <= std_logic_vector(to_unsigned(clogb2((C_M_AXI_DATA_WIDTH/8)-1), 3));
  --INCR burst type is usually used, except for keyhole bursts
  M_AXI_AWBURST    <= "01";
  M_AXI_AWLOCK     <= '0';
  --Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
  M_AXI_AWCACHE    <= "0010";
  M_AXI_AWPROT     <= "000";
  M_AXI_AWQOS      <= x"0";
  M_AXI_AWUSER     <= (others => '1');
  M_AXI_AWVALID    <= axi_awvalid;
  --Write Data(W)
  M_AXI_WDATA      <= axi_wdata;
  --All bursts are complete and aligned in this example
  --M_AXI_WSTRB <= (others => '1');
  M_AXI_WLAST      <= axi_wlast;
  M_AXI_WUSER      <= (others => '0');
  M_AXI_WVALID     <= axi_wvalid;
  --Write Response (B)
  M_AXI_BREADY     <= axi_bready;
  --Read Address (AR)
  M_AXI_ARID       <= (others => '0');
  M_AXI_ARADDR     <= std_logic_vector(unsigned(spriteBaseAddr) + unsigned(axi_araddr));
  --Burst LENgth is number of transaction beats, minus 1
  M_AXI_ARLEN      <= std_logic_vector(to_unsigned(actualBurstLen - 1, 8));
  --Size should be C_M_AXI_DATA_WIDTH, in 2^n bytes, otherwise narrow bursts are used
  M_AXI_ARSIZE     <= std_logic_vector(to_unsigned(clogb2((C_M_AXI_DATA_WIDTH/8)-1), 3));
  --INCR burst type is usually used, except for keyhole bursts
  M_AXI_ARBURST    <= "01";
  M_AXI_ARLOCK     <= '0';
  --Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
  M_AXI_ARCACHE    <= "0010";
  M_AXI_ARPROT     <= "000";
  M_AXI_ARQOS      <= x"0";
  M_AXI_ARUSER     <= (others => '1');
  M_AXI_ARVALID    <= axi_arvalid;
  --Read and Read Response (R)
  M_AXI_RREADY     <= axi_rready;
  --Example design I/O
  TXN_DONE         <= compare_done;
  --Burst size in bytes
  burst_size_bytes <= std_logic_vector(to_unsigned((actualBurstLen * (C_M_AXI_DATA_WIDTH/8)), C_TRANSACTIONS_NUM+3));

  -- if this is a full buffer clear (sprite is the full screen) then use a burst length of 256 rather than 32 
  actualBurstLen <= 256 when to_integer(unsigned(spriteHeight)) = 1024 and to_integer(unsigned(spriteWidth)) = 1280 else 32;

  -- logic to change the current buffer when switch_buffer is toggled 
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0') then
        currBuffAddr  <= bufferAddr2;
        bufferUpdated <= '0';
      else
        if(switch_buffer = '1' and bufferUpdated = '0') then
          if(currBuffAddr = bufferAddr2) then
            currBuffAddr  <= bufferAddr;
            bufferUpdated <= '1';
          else
            currBuffAddr  <= bufferAddr2;
            bufferUpdated <= '1';
          end if;
        elsif(switch_buffer = '0') then
          bufferUpdated <= '0';
        end if;
      end if;
    end if;
  end process;

  --Generate a pulse to initiate AXI transaction.
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      -- Initiates AXI transaction delay        
      if (M_AXI_ARESETN = '0') then
        init_txn_ff  <= '0';
        init_txn_ff2 <= '0';
      else
        init_txn_ff  <= start;
        init_txn_ff2 <= init_txn_ff;
      end if;
    end if;
  end process;


  ----------------------
  --Write Address Channel
  ----------------------
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or init_txn_pulse = '1') then
        axi_awvalid <= '0';
      else
        -- If previously not valid , start next transaction            
        if (axi_awvalid = '0' and start_single_burst_write = '1') then
          axi_awvalid <= '1';
        -- Once asserted, VALIDs cannot be deasserted, so axi_awvalid
        -- must wait until transaction is accepted                   
        elsif (M_AXI_AWREADY = '1' and axi_awvalid = '1') then
          axi_awvalid <= '0';
        else
          axi_awvalid <= axi_awvalid;
        end if;
      end if;
    end if;
  end process;

  -- determine current position to write in buffer based on x,y inputs and the current sprite offsets  
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or compare_done = '1') then
        xOffset    <= (others => '0');
        yOffset    <= (others => '0');
        spriteDone <= '0';

        axi_awaddr <= std_logic_vector(shift_left(shift_left(unsigned(y), 10) + shift_left(unsigned(y), 8) + unsigned(x), 2));
      else
        if (wnext = '1') then
          -- if the x offset is past the sprite width, reset x and increment y 
          if(std_logic_vector(to_unsigned(to_integer(unsigned(xOffset)), 32)) >= std_logic_vector(to_unsigned(to_integer(unsigned(spriteWidth)) - 1, 32)) and spriteDone = '0') then

            -- if the y offset is past the sprite height, the sprite is done 
            if(to_integer(unsigned(yOffset)) >= (to_integer(unsigned(spriteHeight))-1)) then
              spriteDone <= '1';
            else
              spriteDone <= '0';
            end if;

            xOffset <= (others => '0');
            yOffset <= std_logic_vector(to_unsigned(to_integer(unsigned(yOffset)) + 1, 32));
          elsif(spriteDone = '0') then
            xOffset <= std_logic_vector(to_unsigned(to_integer(unsigned(xOffset)) + 1, 32));
          end if;

        end if;
        axi_awaddr <= std_logic_vector(shift_left(shift_left(unsigned(y) + unsigned(yOffset), 10) + shift_left(unsigned(y) + unsigned(yOffset), 8) + unsigned(x) + unsigned(xOffset), 2));
      end if;
    end if;
  end process;

  -- disable byte enables when off screen or when writing transparent color  
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or compare_done = '1') then
        M_AXI_WSTRB <= (others => '0');
      else
        if (wnext = '1') then
          if(to_integer(unsigned(x))+to_integer(unsigned(xOffset)) > 1280) then
            M_AXI_WSTRB <= (others => '0');
          elsif(to_integer(unsigned(x))+to_integer(unsigned(xOffset)) < 0) then
            M_AXI_WSTRB <= (others => '0');
          elsif(spriteData(to_integer(unsigned(write_index))) = transparentColor) then
            M_AXI_WSTRB <= (others => '0');
          elsif(spriteDone = '1') then
            M_AXI_WSTRB <= (others => '0');
          else
            M_AXI_WSTRB <= (others => '1');
          end if;

        end if;
      end if;
    end if;
  end process;

  ----------------------
  --Write Data Channel
  ----------------------
  wnext <= M_AXI_WREADY and axi_wvalid;

  -- WVALID logic, similar to the axi_awvalid always block above                      
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or init_txn_pulse = '1') then
        axi_wvalid <= '0';
      else
        if (axi_wvalid = '0' and start_single_burst_write = '1') then
          -- If previously not valid, start next transaction                        
          axi_wvalid <= '1';
        --     /* If WREADY and too many writes, throttle WVALID                  
        --      Once asserted, VALIDs cannot be deasserted, so WVALID             
        --      must wait until burst is complete with WLAST */                   
        elsif (wnext = '1' and axi_wlast = '1') then
          axi_wvalid <= '0';
        else
          axi_wvalid <= axi_wvalid;
        end if;
      end if;
    end if;
  end process;

  --WLAST generation on the MSB of a counter underflow                                
  -- WVALID logic, similar to the axi_awvalid always block above                      
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or init_txn_pulse = '1') then
        axi_wlast <= '0';
      -- axi_wlast is asserted when the write index                               
      -- count reaches the penultimate count to synchronize                       
      -- with the last write data when write_index is b1111                       
      -- elsif (&(write_index[C_TRANSACTIONS_NUM-1:1])&& ~write_index[0] && wnext)
      else
        if ((((write_index = std_logic_vector(to_unsigned(actualBurstLen-2, C_TRANSACTIONS_NUM+1))) and actualBurstLen >= 2) and wnext = '1') or (actualBurstLen = 1)) then
          axi_wlast <= '1';
        -- Deassrt axi_wlast when the last write data has been                    
        -- accepted by the slave with a valid response                            
        elsif (wnext = '1') then
          axi_wlast <= '0';
        elsif (axi_wlast = '1' and actualBurstLen = 1) then
          axi_wlast <= '0';
        end if;
      end if;
    end if;
  end process;

  -- Burst length counter. Uses extra counter register bit to indicate terminal       
  -- count to reduce decode logic */                                                  
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or start_single_burst_write = '1' or init_txn_pulse = '1') then
        write_index <= (others => '0');
      else
        if (wnext = '1' and (write_index /= std_logic_vector(to_unsigned(actualBurstLen-1, C_TRANSACTIONS_NUM+1)))) then
          write_index <= std_logic_vector(unsigned(write_index) + 1);
        end if;
      end if;
    end if;
  end process;

  axi_wdata <= spriteData(to_integer(unsigned(write_index)));

  ------------------------------
  --Write Response (B) Channel
  ------------------------------
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or init_txn_pulse = '1') then
        axi_bready <= '0';
      -- accept/acknowledge bresp with axi_bready by the master       
      -- when M_AXI_BVALID is asserted by slave                       
      else
        if (M_AXI_BVALID = '1' and axi_bready = '0') then
          axi_bready <= '1';
        -- deassert after one clock cycle                             
        elsif (axi_bready = '1') then
          axi_bready <= '0';
        end if;
      end if;
    end if;
  end process;


  --Flag any write response errors                                        
  write_resp_error <= axi_bready and M_AXI_BVALID and M_AXI_BRESP(1);


  ------------------------------
  --Read Address Channel
  ------------------------------

  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or init_txn_pulse = '1') then
        axi_arvalid <= '0';
      -- If previously not valid , start next transaction             
      else
        if (axi_arvalid = '0' and start_single_burst_read = '1') then
          axi_arvalid <= '1';
        elsif (M_AXI_ARREADY = '1' and axi_arvalid = '1') then
          axi_arvalid <= '0';
        end if;
      end if;
    end if;
  end process;

  -- Next address after ARREADY indicates previous address acceptance  
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or compare_done = '1') then
        axi_araddr <= (others => '0');
      else
        if (M_AXI_ARREADY = '1' and axi_arvalid = '1') then
          axi_araddr <= std_logic_vector(unsigned(axi_araddr) + unsigned(burst_size_bytes));
        end if;
      end if;
    end if;
  end process;


  ----------------------------------
  --Read Data (and Response) Channel
  ----------------------------------

  -- Forward movement occurs when the channel is valid and ready   
  rnext <= M_AXI_RVALID and axi_rready;


  -- Burst length counter. Uses extra counter register bit to indicate    
  -- terminal count to reduce decode logic                                
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or start_single_burst_read = '1' or init_txn_pulse = '1') then
        read_index <= (others => '0');
      else
        if (rnext = '1' and (read_index <= std_logic_vector(to_unsigned(actualBurstLen-1, C_TRANSACTIONS_NUM+1)))) then
          read_index <= std_logic_vector(unsigned(read_index) + 1);
        end if;
      end if;
    end if;
  end process;

  --/*                                                                    
  -- The Read Data channel returns the results of the read request        
  --                                                                      
  -- In this example the data checker is always able to accept            
  -- more data, so no need to throttle the RREADY signal                  
  -- */                                                                   
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or init_txn_pulse = '1') then
        axi_rready <= '0';
      -- accept/acknowledge rdata/rresp with axi_rready by the master    
      -- when M_AXI_RVALID is asserted by slave                         
      else
        if (M_AXI_RVALID = '1') then
          if (M_AXI_RLAST = '1' and axi_rready = '1') then
            axi_rready <= '0';
          else
            axi_rready <= '1';
          end if;
        end if;
      end if;
    end if;
  end process;


  --save the sprite data for burst write to buffer                    
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or init_txn_pulse = '1') then
        spriteData <= (others => (others => '0'));
      else
        if (rnext = '1') then
          spriteData(to_integer(unsigned(read_index))) <= M_AXI_RDATA;
        end if;
      end if;
    end if;
  end process;


  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or init_txn_pulse = '1') then
        write_burst_counter <= (others => '0');
      else
        if (M_AXI_AWREADY = '1' and axi_awvalid = '1') then
          if (write_burst_counter(C_NO_BURSTS_REQ) = '0')then
            write_burst_counter <= std_logic_vector(unsigned(write_burst_counter) + 1);
          end if;
        end if;
      end if;
    end if;
  end process;

  -- read_burst_counter counter keeps track with the number of burst transaction initiated                    
  -- against the number of burst transactions the master needs to initiate                                    
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or init_txn_pulse = '1') then
        read_burst_counter <= (others => '0');
      else
        if (M_AXI_ARREADY = '1' and axi_arvalid = '1') then
          if (read_burst_counter(C_NO_BURSTS_REQ) = '0')then
            read_burst_counter <= std_logic_vector(unsigned(read_burst_counter) + 1);
          end if;
        end if;
      end if;
    end if;
  end process;


  MASTER_EXECUTION_PROC : process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0') then
        -- reset condition                                                                                   
        -- All the signals are ed default values under reset condition                                       
        mst_exec_state           <= IDLE;
        compare_done             <= '0';
        start_single_burst_write <= '0';
        start_single_burst_read  <= '0';
        error                    <= '0';
      else
        -- state transition                                                                                  
        case (mst_exec_state) is

          when IDLE =>
            -- wait for another sprite to display                                                                                                                                  
            compare_done   <= '1';
            init_txn_pulse <= '0';

            if (INIT_AXI_TXN = '1') then
              mst_exec_state <= SETUP;
            else
              mst_exec_state <= IDLE;
            end if;


          when SETUP =>
            -- start the read/write of another burst of the sprite 
            compare_done   <= '0';
            init_txn_pulse <= '1';
            if(spriteDone = '1') then
              mst_exec_state <= IDLE;
            elsif(init_txn_pulse = '1') then
              mst_exec_state <= INIT_READ;
              init_txn_pulse <= '0';
            end if;


          when INIT_WRITE =>
            -- wrtie sprite burst to the buffer 
            init_txn_pulse <= '0';
            if (writes_done = '1') then
              mst_exec_state <= SETUP;
            else
              mst_exec_state <= INIT_WRITE;

              if (axi_awvalid = '0' and start_single_burst_write = '0' and burst_write_active = '0') then
                start_single_burst_write <= '1';
              else
                start_single_burst_write <= '0';  --Negate to generate a pulse                              
              end if;
            end if;

          when INIT_READ =>
            -- read sprite burst from memory 
            init_txn_pulse <= '0';
            if (reads_done = '1') then
              mst_exec_state <= INIT_WRITE;
            else
              mst_exec_state <= INIT_READ;

              if (axi_arvalid = '0' and burst_read_active = '0' and start_single_burst_read = '0') then
                start_single_burst_read <= '1';
              else
                start_single_burst_read <= '0';  --Negate to generate a pulse                               
              end if;
            end if;

          when others =>
            mst_exec_state <= IDLE;
        end case;
      end if;
    end if;
  end process;


  -- burst_write_active signal is asserted when there is a burst write transaction                           
  -- is initiated by the assertion of start_single_burst_write. burst_write_active                           
  -- signal remains asserted until the burst write is accepted by the slave                                  
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or init_txn_pulse = '1') then
        burst_write_active <= '0';

      --The burst_write_active is asserted when a write burst transaction is initiated                      
      else
        if (start_single_burst_write = '1') then
          burst_write_active <= '1';
        elsif (M_AXI_BVALID = '1' and axi_bready = '1') then
          burst_write_active <= '0';
        end if;
      end if;
    end if;
  end process;

  -- Check for last write completion.                                                                         

  -- This logic is to qualify the last write count with the final write                                       
  -- response. This demonstrates how to confirm that a write has been                                         
  -- committed.                                                                                               

  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or init_txn_pulse = '1') then
        writes_done <= '0';
      --The reads_done should be associated with a rready response                                           
      --elsif (M_AXI_RVALID && axi_rready && (read_burst_counter == {(C_NO_BURSTS_REQ-1){1}}) && axi_rlast)  
      else
        if (M_AXI_BVALID = '1' and (write_burst_counter(C_NO_BURSTS_REQ) = '1') and axi_bready = '1') then
          writes_done <= '1';
        end if;
      end if;
    end if;
  end process;

  -- burst_read_active signal is asserted when there is a burst write transaction                            
  -- is initiated by the assertion of start_single_burst_write. start_single_burst_read                      
  -- signal remains asserted until the burst read is accepted by the master                                  
  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or init_txn_pulse = '1') then
        burst_read_active <= '0';

      --The burst_write_active is asserted when a write burst transaction is initiated                      
      else
        if (start_single_burst_read = '1')then
          burst_read_active <= '1';
        elsif (M_AXI_RVALID = '1' and axi_rready = '1' and M_AXI_RLAST = '1') then
          burst_read_active <= '0';
        end if;
      end if;
    end if;
  end process;

  -- Check for last read completion.                                                                          

  -- This logic is to qualify the last read count with the final read                                         
  -- response. This demonstrates how to confirm that a read has been                                          
  -- committed.                                                                                               

  process(M_AXI_ACLK)
  begin
    if (rising_edge (M_AXI_ACLK)) then
      if (M_AXI_ARESETN = '0' or init_txn_pulse = '1') then
        reads_done <= '0';
      --The reads_done should be associated with a rready response                                         
      --elsif (M_AXI_RVALID && axi_rready && (read_burst_counter == {(C_NO_BURSTS_REQ-1){1}}) && axi_rlast)
      else
        if (M_AXI_RVALID = '1' and axi_rready = '1' and (read_index = std_logic_vector (to_unsigned(actualBurstLen-1, C_TRANSACTIONS_NUM+1))) and (read_burst_counter(C_NO_BURSTS_REQ) = '1')) then
          reads_done <= '1';
        end if;
      end if;
    end if;
  end process;

  -- Add user logic here

  -- User logic ends

  end implementation;

