library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Generated by: Vivado, Edited by: Matthew 
-- File generated from vivado new custom ip menu with edits to support the connection of 
-- between the AXI Lite and the main GPU logic with the two AXI masters.  
-- This file has the wrappers to connect the different components of the GPU 

entity GPU_v4_0 is
	generic ( 
		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 6;

		-- Parameters of Axi Master Bus Interface M00_AXI

		-------------------- user has option to modify these in block diagram 
		-- the two buffer addresses 
	    bufferAddress	: std_logic_vector	:= x"40000000";
		bufferAddress2	: std_logic_vector	:= x"40000000";
		-- color that will enable the write strobe and cause the data to 
		-- not actually be written to the buffer 
	    alphaColor : std_logic_vector	:= x"fffffff7" ;
		
		------------------------------------------------
	    
		C_M00_AXI_BURST_LEN	: integer	:= 16;
		C_M00_AXI_ID_WIDTH	: integer	:= 1;
		C_M00_AXI_ADDR_WIDTH	: integer	:= 32;
		C_M00_AXI_DATA_WIDTH	: integer	:= 32;
		C_M00_AXI_AWUSER_WIDTH	: integer	:= 0;
		C_M00_AXI_ARUSER_WIDTH	: integer	:= 0;
		C_M00_AXI_WUSER_WIDTH	: integer	:= 0;
		C_M00_AXI_RUSER_WIDTH	: integer	:= 0;
		C_M00_AXI_BUSER_WIDTH	: integer	:= 0;

		-- Parameters of Axi Master Bus Interface M01_AXI
		C_M01_AXI_BURST_LEN	: integer	:= 16;
		C_M01_AXI_ID_WIDTH	: integer	:= 1;
		C_M01_AXI_ADDR_WIDTH	: integer	:= 32;
		C_M01_AXI_DATA_WIDTH	: integer	:= 32;
		C_M01_AXI_AWUSER_WIDTH	: integer	:= 0;
		C_M01_AXI_ARUSER_WIDTH	: integer	:= 0;
		C_M01_AXI_WUSER_WIDTH	: integer	:= 0;
		C_M01_AXI_RUSER_WIDTH	: integer	:= 0;
		C_M01_AXI_BUSER_WIDTH	: integer	:= 0
	);
	port (
		-- Users to add ports here
        switch_buff	: out std_logic;
        switch_buff_ack : in std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk	: in std_logic;
		s00_axi_aresetn	: in std_logic;
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic;

		-- Ports of Axi Master Bus Interface M00_AXI
		m00_axi_aclk	: in std_logic;
		
		m00_axi_aresetn	: in std_logic;
		m00_axi_awid	: out std_logic_vector(C_M00_AXI_ID_WIDTH-1 downto 0);
		m00_axi_awaddr	: out std_logic_vector(C_M00_AXI_ADDR_WIDTH-1 downto 0);
		m00_axi_awlen	: out std_logic_vector(7 downto 0);
		m00_axi_awsize	: out std_logic_vector(2 downto 0);
		m00_axi_awburst	: out std_logic_vector(1 downto 0);
		m00_axi_awlock	: out std_logic;
		m00_axi_awcache	: out std_logic_vector(3 downto 0);
		m00_axi_awprot	: out std_logic_vector(2 downto 0);
		m00_axi_awqos	: out std_logic_vector(3 downto 0);
		m00_axi_awuser	: out std_logic_vector(C_M00_AXI_AWUSER_WIDTH-1 downto 0);
		m00_axi_awvalid	: out std_logic;
		m00_axi_awready	: in std_logic;
		m00_axi_wdata	: out std_logic_vector(C_M00_AXI_DATA_WIDTH-1 downto 0);
		m00_axi_wstrb	: out std_logic_vector(C_M00_AXI_DATA_WIDTH/8-1 downto 0);
		m00_axi_wlast	: out std_logic;
		m00_axi_wuser	: out std_logic_vector(C_M00_AXI_WUSER_WIDTH-1 downto 0);
		m00_axi_wvalid	: out std_logic;
		m00_axi_wready	: in std_logic;
		m00_axi_bid	: in std_logic_vector(C_M00_AXI_ID_WIDTH-1 downto 0);
		m00_axi_bresp	: in std_logic_vector(1 downto 0);
		m00_axi_buser	: in std_logic_vector(C_M00_AXI_BUSER_WIDTH-1 downto 0);
		m00_axi_bvalid	: in std_logic;
		m00_axi_bready	: out std_logic;	
		m00_axi_arid	: out std_logic_vector(C_M00_AXI_ID_WIDTH-1 downto 0);
		m00_axi_araddr	: out std_logic_vector(C_M00_AXI_ADDR_WIDTH-1 downto 0);
		m00_axi_arlen	: out std_logic_vector(7 downto 0);
		m00_axi_arsize	: out std_logic_vector(2 downto 0);
		m00_axi_arburst	: out std_logic_vector(1 downto 0);
		m00_axi_arlock	: out std_logic;
		m00_axi_arcache	: out std_logic_vector(3 downto 0);
		m00_axi_arprot	: out std_logic_vector(2 downto 0);
		m00_axi_arqos	: out std_logic_vector(3 downto 0);
		m00_axi_aruser	: out std_logic_vector(C_M00_AXI_ARUSER_WIDTH-1 downto 0);
		m00_axi_arvalid	: out std_logic;
		m00_axi_arready	: in std_logic;
		m00_axi_rid	: in std_logic_vector(C_M00_AXI_ID_WIDTH-1 downto 0);
		m00_axi_rdata	: in std_logic_vector(C_M00_AXI_DATA_WIDTH-1 downto 0);
		m00_axi_rresp	: in std_logic_vector(1 downto 0);
		m00_axi_rlast	: in std_logic;
		m00_axi_ruser	: in std_logic_vector(C_M00_AXI_RUSER_WIDTH-1 downto 0);
		m00_axi_rvalid	: in std_logic;
		m00_axi_rready	: out std_logic;

		-- Ports of Axi Master Bus Interface M01_AXI
		m01_axi_aclk	: in std_logic;
		
		m01_axi_aresetn	: in std_logic;
		m01_axi_awid	: out std_logic_vector(C_M01_AXI_ID_WIDTH-1 downto 0);
		m01_axi_awaddr	: out std_logic_vector(C_M01_AXI_ADDR_WIDTH-1 downto 0);
		m01_axi_awlen	: out std_logic_vector(7 downto 0);
		m01_axi_awsize	: out std_logic_vector(2 downto 0);
		m01_axi_awburst	: out std_logic_vector(1 downto 0);
		m01_axi_awlock	: out std_logic;
		m01_axi_awcache	: out std_logic_vector(3 downto 0);
		m01_axi_awprot	: out std_logic_vector(2 downto 0);
		m01_axi_awqos	: out std_logic_vector(3 downto 0);
		m01_axi_awuser	: out std_logic_vector(C_M01_AXI_AWUSER_WIDTH-1 downto 0);
		m01_axi_awvalid	: out std_logic;
		m01_axi_awready	: in std_logic;
		m01_axi_wdata	: out std_logic_vector(C_M01_AXI_DATA_WIDTH-1 downto 0);
		m01_axi_wstrb	: out std_logic_vector(C_M01_AXI_DATA_WIDTH/8-1 downto 0);
		m01_axi_wlast	: out std_logic;
		m01_axi_wuser	: out std_logic_vector(C_M01_AXI_WUSER_WIDTH-1 downto 0);
		m01_axi_wvalid	: out std_logic;
		m01_axi_wready	: in std_logic;
		m01_axi_bid	: in std_logic_vector(C_M01_AXI_ID_WIDTH-1 downto 0);
		m01_axi_bresp	: in std_logic_vector(1 downto 0);
		m01_axi_buser	: in std_logic_vector(C_M01_AXI_BUSER_WIDTH-1 downto 0);
		m01_axi_bvalid	: in std_logic;
		m01_axi_bready	: out std_logic;
		m01_axi_arid	: out std_logic_vector(C_M01_AXI_ID_WIDTH-1 downto 0);
		m01_axi_araddr	: out std_logic_vector(C_M01_AXI_ADDR_WIDTH-1 downto 0);
		m01_axi_arlen	: out std_logic_vector(7 downto 0);
		m01_axi_arsize	: out std_logic_vector(2 downto 0);
		m01_axi_arburst	: out std_logic_vector(1 downto 0);
		m01_axi_arlock	: out std_logic;
		m01_axi_arcache	: out std_logic_vector(3 downto 0);
		m01_axi_arprot	: out std_logic_vector(2 downto 0);
		m01_axi_arqos	: out std_logic_vector(3 downto 0);
		m01_axi_aruser	: out std_logic_vector(C_M01_AXI_ARUSER_WIDTH-1 downto 0);
		m01_axi_arvalid	: out std_logic;
		m01_axi_arready	: in std_logic;
		m01_axi_rid	: in std_logic_vector(C_M01_AXI_ID_WIDTH-1 downto 0);
		m01_axi_rdata	: in std_logic_vector(C_M01_AXI_DATA_WIDTH-1 downto 0);
		m01_axi_rresp	: in std_logic_vector(1 downto 0);
		m01_axi_rlast	: in std_logic;
		m01_axi_ruser	: in std_logic_vector(C_M01_AXI_RUSER_WIDTH-1 downto 0);
		m01_axi_rvalid	: in std_logic;
		m01_axi_rready	: out std_logic
	);
end GPU_v4_0;

architecture arch_imp of GPU_v4_0 is

signal m00_axi_init_axi_txn: std_logic;
signal m00_axi_txn_done: std_logic;
signal m00_axi_error: std_logic;
signal switch_buff_gpu: std_logic;

signal  xSIG : std_logic_vector(31 downto 0); 
signal  ySIG :   std_logic_vector(31 downto 0); 
signal spriteHeightSIG   :  std_logic_vector(31 downto 0); 
signal spriteWidthSIG    :  std_logic_vector(31 downto 0); 
signal spriteADDR: std_logic_vector(31 downto 0); 


	-- component declaration
	component GPU_v4_0_S00_AXI is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 6
		);
		port (
		
        switch_buffer_gpu : out std_logic; 
	    switch_buffer : out std_logic; 
		switch_buffer_ack : in std_logic; 
		
		
		init_txn : out std_logic; 
        txn_done : in std_logic;
        txn_error : in std_logic; 
		spriteAddr : out std_logic_vector(31 downto 0); 
		xIN : out  std_logic_vector(31 downto 0); 
        yIN : out  std_logic_vector(31 downto 0); 
        spriteHeightIN   : out std_logic_vector(31 downto 0); 
        spriteWidthIN    : out std_logic_vector(31 downto 0); 
		
		
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component GPU_v4_0_S00_AXI;

	component GPU_v4_0_M00_AXI is
		generic (
		bufferAddr	: std_logic_vector	:= x"40000000";
		bufferAddr2	: std_logic_vector	:= x"40000000";
	    transparentColor : std_logic_vector	:= x"91F00000" ;
		C_M_AXI_BURST_LEN	: integer	:= 16;
		C_M_AXI_ID_WIDTH	: integer	:= 1;
		C_M_AXI_ADDR_WIDTH	: integer	:= 32;
		C_M_AXI_DATA_WIDTH	: integer	:= 32;
		C_M_AXI_AWUSER_WIDTH	: integer	:= 0;
		C_M_AXI_ARUSER_WIDTH	: integer	:= 0;
		C_M_AXI_WUSER_WIDTH	: integer	:= 0;
		C_M_AXI_RUSER_WIDTH	: integer	:= 0;
		C_M_AXI_BUSER_WIDTH	: integer	:= 0
		);
		port (
	    switch_buffer : in std_logic; 
		x : in  std_logic_vector(31 downto 0); 
        y : in  std_logic_vector(31 downto 0); 
        spriteHeight   : in std_logic_vector(31 downto 0); 
        spriteWidth    : in std_logic_vector(31 downto 0); 
		spriteBaseAddr : in std_logic_vector(31 downto 0); 
		INIT_AXI_TXN	: in std_logic;
		TXN_DONE	: out std_logic;
		ERROR	: out std_logic;
		M_AXI_ACLK	: in std_logic;
	    M_AXI_ACLK_R	: in std_logic;
		M_AXI_ARESETN	: in std_logic;
		M_AXI_AWID	: out std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
		M_AXI_AWADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
		M_AXI_AWLEN	: out std_logic_vector(7 downto 0);
		M_AXI_AWSIZE	: out std_logic_vector(2 downto 0);
		M_AXI_AWBURST	: out std_logic_vector(1 downto 0);
		M_AXI_AWLOCK	: out std_logic;
		M_AXI_AWCACHE	: out std_logic_vector(3 downto 0);
		M_AXI_AWPROT	: out std_logic_vector(2 downto 0);
		M_AXI_AWQOS	: out std_logic_vector(3 downto 0);
		M_AXI_AWUSER	: out std_logic_vector(C_M_AXI_AWUSER_WIDTH-1 downto 0);
		M_AXI_AWVALID	: out std_logic;
		M_AXI_AWREADY	: in std_logic;
		M_AXI_WDATA	: out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
		M_AXI_WSTRB	: out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0);
		M_AXI_WLAST	: out std_logic;
		M_AXI_WUSER	: out std_logic_vector(C_M_AXI_WUSER_WIDTH-1 downto 0);
		M_AXI_WVALID	: out std_logic;
		M_AXI_WREADY	: in std_logic;
		M_AXI_BID	: in std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
		M_AXI_BRESP	: in std_logic_vector(1 downto 0);
		M_AXI_BUSER	: in std_logic_vector(C_M_AXI_BUSER_WIDTH-1 downto 0);
		M_AXI_BVALID	: in std_logic;
		M_AXI_BREADY	: out std_logic;
		M_AXI_ARID	: out std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
		M_AXI_ARADDR	: out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
		M_AXI_ARLEN	: out std_logic_vector(7 downto 0);
		M_AXI_ARSIZE	: out std_logic_vector(2 downto 0);
		M_AXI_ARBURST	: out std_logic_vector(1 downto 0);
		M_AXI_ARLOCK	: out std_logic;
		M_AXI_ARCACHE	: out std_logic_vector(3 downto 0);
		M_AXI_ARPROT	: out std_logic_vector(2 downto 0);
		M_AXI_ARQOS	: out std_logic_vector(3 downto 0);
		M_AXI_ARUSER	: out std_logic_vector(C_M_AXI_ARUSER_WIDTH-1 downto 0);
		M_AXI_ARVALID	: out std_logic;
		M_AXI_ARREADY	: in std_logic;
		M_AXI_RID	: in std_logic_vector(C_M_AXI_ID_WIDTH-1 downto 0);
		M_AXI_RDATA	: in std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
		M_AXI_RRESP	: in std_logic_vector(1 downto 0);
		M_AXI_RLAST	: in std_logic;
		M_AXI_RUSER	: in std_logic_vector(C_M_AXI_RUSER_WIDTH-1 downto 0);
		M_AXI_RVALID	: in std_logic;
		M_AXI_RREADY	: out std_logic
		);
	end component GPU_v4_0_M00_AXI;

begin

-- Instantiation of Axi Bus Interface S00_AXI
GPU_v2_0_S00_AXI_inst : GPU_v4_0_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
	
	   switch_buffer => switch_buff,
	   switch_buffer_ack =>  switch_buff_ack, 
	   switch_buffer_gpu => switch_buff_gpu, 
	
	   init_txn => m00_axi_init_axi_txn,
       txn_done => m00_axi_txn_done,
       txn_error => m00_axi_error,
	   spriteAddr => spriteADDR, 
	   xIN => xSIG,
       yIN => ySIG,
       spriteHeightIN => spriteHeightSIG,  
       spriteWidthIN  => spriteWidthSIG, 
	
	
		S_AXI_ACLK	=> s00_axi_aclk,
		S_AXI_ARESETN	=> s00_axi_aresetn,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WDATA	=> s00_axi_wdata,
		S_AXI_WSTRB	=> s00_axi_wstrb,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BRESP	=> s00_axi_bresp,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RDATA	=> s00_axi_rdata,
		S_AXI_RRESP	=> s00_axi_rresp,
		S_AXI_RVALID	=> s00_axi_rvalid,
		S_AXI_RREADY	=> s00_axi_rready
	);

-- Instantiation of Axi Bus Interface M00_AXI
GPU_v2_0_M00_AXI_inst : GPU_v4_0_M00_AXI
	generic map (
	   transparentColor => alphaColor, 
		bufferAddr	=> bufferAddress,
		bufferAddr2	=> bufferAddress2,
		C_M_AXI_BURST_LEN	=> C_M00_AXI_BURST_LEN,
		C_M_AXI_ID_WIDTH	=> C_M00_AXI_ID_WIDTH,
		C_M_AXI_ADDR_WIDTH	=> C_M00_AXI_ADDR_WIDTH,
		C_M_AXI_DATA_WIDTH	=> C_M00_AXI_DATA_WIDTH,
		C_M_AXI_AWUSER_WIDTH	=> C_M00_AXI_AWUSER_WIDTH,
		C_M_AXI_ARUSER_WIDTH	=> C_M00_AXI_ARUSER_WIDTH,
		C_M_AXI_WUSER_WIDTH	=> C_M00_AXI_WUSER_WIDTH,
		C_M_AXI_RUSER_WIDTH	=> C_M00_AXI_RUSER_WIDTH,
		C_M_AXI_BUSER_WIDTH	=> C_M00_AXI_BUSER_WIDTH
	)
	port map (
	    switch_buffer => switch_buff_gpu, 
	    x => xSIG, 
        y => ySIG,
        spriteHeight => spriteHeightSIG,
        spriteWidth => spriteWidthSIG,
	    spriteBaseAddr => spriteADDR,
	
		INIT_AXI_TXN	=> m00_axi_init_axi_txn,
		TXN_DONE	=> m00_axi_txn_done,
		ERROR	=> m00_axi_error,
		M_AXI_ACLK_R	=> m01_axi_aclk,
	    M_AXI_ACLK => m00_axi_aclk,
		M_AXI_ARESETN	=> m00_axi_aresetn,
		M_AXI_AWID	=> m00_axi_awid,
		M_AXI_AWADDR	=> m00_axi_awaddr,
		M_AXI_AWLEN	=> m00_axi_awlen,
		M_AXI_AWSIZE	=> m00_axi_awsize,
		M_AXI_AWBURST	=> m00_axi_awburst,
		M_AXI_AWLOCK	=> m00_axi_awlock,
		M_AXI_AWCACHE	=> m00_axi_awcache,
		M_AXI_AWPROT	=> m00_axi_awprot,
		M_AXI_AWQOS	=> m00_axi_awqos,
		M_AXI_AWUSER	=> m00_axi_awuser,
		M_AXI_AWVALID	=> m00_axi_awvalid,
		M_AXI_AWREADY	=> m00_axi_awready,
		M_AXI_WDATA	=> m00_axi_wdata,
		M_AXI_WSTRB	=> m00_axi_wstrb,
		M_AXI_WLAST	=> m00_axi_wlast,
		M_AXI_WUSER	=> m00_axi_wuser,
		M_AXI_WVALID	=> m00_axi_wvalid,
		M_AXI_WREADY	=> m00_axi_wready,
		M_AXI_BID	=> m00_axi_bid,
		M_AXI_BRESP	=> m00_axi_bresp,
		M_AXI_BUSER	=> m00_axi_buser,
		M_AXI_BVALID	=> m00_axi_bvalid,
		M_AXI_BREADY	=> m00_axi_bready,
		
		-- second port 
		M_AXI_ARID	=> m01_axi_arid,
		M_AXI_ARADDR	=> m01_axi_araddr,
		M_AXI_ARLEN	=> m01_axi_arlen,
		M_AXI_ARSIZE	=> m01_axi_arsize,
		M_AXI_ARBURST	=> m01_axi_arburst,
		M_AXI_ARLOCK	=> m01_axi_arlock,
		M_AXI_ARCACHE	=> m01_axi_arcache,
		M_AXI_ARPROT	=> m01_axi_arprot,
		M_AXI_ARQOS	=> m01_axi_arqos,
		M_AXI_ARUSER	=> m01_axi_aruser,
		M_AXI_ARVALID	=> m01_axi_arvalid,
		M_AXI_ARREADY	=> m01_axi_arready,
		M_AXI_RID	=> m01_axi_rid,
		M_AXI_RDATA	=> m01_axi_rdata,
		M_AXI_RRESP	=> m01_axi_rresp,
		M_AXI_RLAST	=> m01_axi_rlast,
		M_AXI_RUSER	=> m01_axi_ruser,
		M_AXI_RVALID	=> m01_axi_rvalid,
		M_AXI_RREADY	=> m01_axi_rready
	);

end arch_imp;