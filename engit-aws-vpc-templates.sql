-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2017 at 12:34 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `engit-aws-vpc-templates`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresstable`
--

CREATE TABLE `addresstable` (
  `destination` varchar(20) CHARACTER SET ascii NOT NULL,
  `addrRange` varchar(20) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addresstable`
--

INSERT INTO `addresstable` (`destination`, `addrRange`) VALUES
('corporate', '64.102.0.0/16'),
('corporate', '173.38.117.0/24'),
('corporate', '128.107.241.0/24'),
('corporate', '171.71.174.0/24'),
('theWorld', '0.0.0.0/0');

-- --------------------------------------------------------

--
-- Table structure for table `customer_request`
--

CREATE TABLE `customer_request` (
  `custid` varchar(20) NOT NULL,
  `custName` varchar(64) NOT NULL,
  `custContact` varchar(128) NOT NULL COMMENT 'Name/email/phone',
  `Instance Type` varchar(15) NOT NULL COMMENT 'dev, sandbox, prod, dr ',
  `jiraServerSize` int(11) NOT NULL COMMENT '0 = server_defs value',
  `confServerSize` int(11) NOT NULL COMMENT '0 = server_defs value',
  `dbSize` int(11) NOT NULL COMMENT '0 = server_defs value',
  `status` varchar(15) NOT NULL COMMENT 'Pending or completed',
  `updated` date NOT NULL COMMENT 'timestamp of when status changed'
) ENGINE=MyISAM DEFAULT CHARSET=ascii;

--
-- Dumping data for table `customer_request`
--

INSERT INTO `customer_request` (`custid`, `custName`, `custContact`, `Instance Type`, `jiraServerSize`, `confServerSize`, `dbSize`, `status`, `updated`) VALUES
('cliqr', 'Clicker whatever, not sure', 'brigrier@cisco.com', 'sandbox', 0, 0, 0, 'pending', '2017-05-18');

-- --------------------------------------------------------

--
-- Table structure for table `keypairs`
--

CREATE TABLE `keypairs` (
  `tokenKey` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `tokenValue` varchar(64) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='General configuration stuff';

--
-- Dumping data for table `keypairs`
--

INSERT INTO `keypairs` (`tokenKey`, `tokenValue`) VALUES
('Groupname', 'alm'),
('ResourceIdSeparator', '-'),
('FQDNseparator', '.'),
('AWSdefaultRegionAbbrv', 'nva'),
('AWSdefaultRegion', 'us-east-1'),
('Owner', 'atlassian-adm');

-- --------------------------------------------------------

--
-- Table structure for table `orchestration_journal`
--

CREATE TABLE `orchestration_journal` (
  `custId` varchar(20) DEFAULT NULL,
  `Result` varchar(20) DEFAULT NULL,
  `Reason` varchar(8192) DEFAULT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=ascii;

--
-- Dumping data for table `orchestration_journal`
--

INSERT INTO `orchestration_journal` (`custId`, `Result`, `Reason`, `Time_Stamp`) VALUES
('bjg', 'Created', 'Creating VPC for bjg    Creating Security Groups    Creating gateway    Creating VMs        Standing up server jira in subnet subnet-95b661b9        Standing up server jump in subnet subnet-43b3646f', '2017-05-23 18:16:21'),
('bjg', 'Created', 'Creating VPC for bjg    Creating Security Groups    Creating gateway    Creating VMs        Standing up server jira in subnet subnet-8ab265a6        Standing up server jump in subnet subnet-91be69bd', '2017-05-23 18:25:50'),
('bjg', 'Created', 'Creating VPC for bjg    Creating Security Groups    Creating gateway    Creating VMs        Standing up server jira in subnet subnet-8eb067a2        Standing up server jump in subnet subnet-06bd6a2a', '2017-05-23 18:30:15'),
('bjg', 'Created', 'Creating VPC for bjg    Creating Security Groups    Creating gateway    Creating VMs        Standing up server jira in subnet subnet-8cbe69a0        Standing up server jump in subnet subnet-51bf687d', '2017-05-23 18:40:22'),
('bjg', 'Created', 'Creating VPC for bjg    Creating Security Groups    Creating gateway    Creating VMs        Standing up server jira in subnet subnet-dcb96ef0        Standing up server jump in subnet subnet-bfb96e93', '2017-05-23 18:45:31'),
('bjg', 'Created', 'Creating VPC for bjg    Creating Security Groups    Creating gateway    Creating VMs        Standing up server jira in subnet subnet-88a473a4        Standing up server pgres2 in subnet subnet-91a374bd        Standing up server pgres1 in subnet subnet-91a374bd        Standing up server jump in subnet subnet-08a57224        Standing up server conf in subnet subnet-88a473a4        Standing up server pgpool in subnet subnet-91a374bd', '2017-05-23 18:57:44'),
('bjg2', 'Error', 'Creating VPC for bjg2Encountered error getting Creating VPC Resource: alm-bjg2\r\n    Error - <class \'botocore.exceptions.ClientError\'> - An error occurred (VpcLimitExceeded) when calling the CreateVpc operation: The maximum number of VPCs has been reached.\r\n          - <class \'botocore.exceptions.ClientError\'>\r\n\r\n', '2017-05-23 19:19:12'),
('poc2', 'Created', 'Creating VPC for poc2    Creating Security Groups    Creating gateway    Creating VMs        Standing up server jira in subnet subnet-fe8757d2        Standing up server pgres2 in subnet subnet-0288582e        Standing up server pgres1 in subnet subnet-0288582e        Standing up server jump in subnet subnet-38875714        Standing up server conf in subnet subnet-fe8757d2        Standing up server pgpool in subnet subnet-0288582e', '2017-05-25 14:07:02'),
('bjg', 'Error', 'Creating VPC for bjgEncountered error while Creating VPC Resource: alm-bjg\r\n    Error - <class \'botocore.exceptions.ClientError\'> - An error occurred (VpcLimitExceeded) when calling the CreateVpc operation: The maximum number of VPCs has been reached.\r\n          - <class \'botocore.exceptions.ClientError\'>\r\n\r\n', '2017-05-25 16:35:11'),
('bjg', 'Error', 'Creating VPC for bjgEncountered error while Creating VPC Resource: alm-bjg\r\n    Error - <class \'botocore.exceptions.ClientError\'> - An error occurred (VpcLimitExceeded) when calling the CreateVpc operation: The maximum number of VPCs has been reached.\r\n          - <class \'botocore.exceptions.ClientError\'>\r\n\r\n', '2017-05-25 17:04:31'),
('bjg', 'Created', 'Creating VPC for bjg    Creating Security Groups    Creating gateway    Creating VMs        Standing up server jira in subnet subnet-b66520ff        Standing up server pgres2 in subnet subnet-3c642175        Standing up server pgres1 in subnet subnet-3c642175        Standing up server jump in subnet subnet-9e6421d7        Standing up server conf in subnet subnet-b66520ff        Standing up server pgpool in subnet subnet-3c642175', '2017-05-25 17:38:27'),
('bjg', 'Error', 'Creating VPC for bjg    Creating Security Groups    Creating gateway    Creating VMs        Standing up server jira in subnet subnet-fa7134b3Encountered error while Creating EC2 instances: alm-bjg-jira\r\n    Error - <class \'botocore.exceptions.ParamValidationError\'> - Parameter validation failed:\nMissing required parameter in input: "ImageId"\r\n          - <class \'botocore.exceptions.ParamValidationError\'>\r\n\r\n', '2017-05-25 18:43:08'),
('bjg', 'Error', 'Creating VPC for bjg    Creating Security Groups    Creating gateway    Creating VMs        Standing up server jira in subnet subnet-8c7035c5Encountered error while Creating EC2 instances: alm-bjg-jira\r\n    Error - <class \'botocore.exceptions.ClientError\'> - An error occurred (InvalidParameter) when calling the RunInstances operation: Parameter encrypted is invalid. You cannot specify the encrypted flag if specifying a snapshot id in a block device mapping.\r\n          - <class \'botocore.exceptions.ClientError\'>\r\n\r\n', '2017-05-25 18:44:20'),
('bjg', 'Created', 'Creating VPC for bjg    Creating Security Groups    Creating gateway    Creating VMs        Standing up server jira in subnet subnet-c27f3a8b        Standing up server pgres2 in subnet subnet-e67d38af        Standing up server pgres1 in subnet subnet-e67d38af        Standing up server jump in subnet subnet-967f3adf        Standing up server conf in subnet subnet-c27f3a8b        Standing up server pgpool in subnet subnet-e67d38af', '2017-05-25 18:59:17'),
('bjg', 'Created', 'Creating VPC for bjg    Creating Security Groups    Creating gateway    Creating VMs        Standing up server jira in subnet subnet-ef793ca6        Standing up server pgres2 in subnet subnet-6d7b3e24        Standing up server pgres1 in subnet subnet-6d7b3e24        Standing up server jump in subnet subnet-0787c24e        Standing up server conf in subnet subnet-ef793ca6        Standing up server pgpool in subnet subnet-6d7b3e24', '2017-05-25 19:20:34'),
('bjg', 'Created', 'Creating VPC for bjg    Creating Security Groups    Creating gateway    Creating VMs        Standing up server jira in subnet subnet-7183c638        Standing up server pgres2 in subnet subnet-3380c57a        Standing up server pgres1 in subnet subnet-3380c57a        Standing up server jump in subnet subnet-d386c39a        Standing up server conf in subnet subnet-7183c638        Standing up server pgpool in subnet subnet-3380c57a', '2017-05-25 19:35:11');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `abbrv` varchar(10) CHARACTER SET ascii NOT NULL COMMENT 'abbreviation to be used in names',
  `descr` varchar(20) CHARACTER SET ascii NOT NULL COMMENT 'Long name of abbrv',
  `AWSRegion` varchar(24) CHARACTER SET ascii DEFAULT NULL,
  `cidr_base` varchar(20) CHARACTER SET ascii DEFAULT NULL,
  `cidr_range` varchar(2) CHARACTER SET ascii DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`abbrv`, `descr`, `AWSRegion`, `cidr_base`, `cidr_range`) VALUES
('ore', 'Oregon', 'us-west-2', '10.0.0.0', '22'),
('nva', 'N. Virginia', 'us-east-1', '10.0.0.0', '22');

-- --------------------------------------------------------

--
-- Table structure for table `security_rules`
--

CREATE TABLE `security_rules` (
  `security_group` varchar(20) CHARACTER SET ascii DEFAULT NULL,
  `direction` varchar(20) CHARACTER SET ascii DEFAULT NULL,
  `protocol` varchar(10) CHARACTER SET ascii DEFAULT NULL,
  `port_range` varchar(20) CHARACTER SET ascii DEFAULT NULL,
  `source` varchar(64) CHARACTER SET ascii DEFAULT NULL COMMENT 'Index into "AddressTable"',
  `description` varchar(64) CHARACTER SET ascii DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `security_rules`
--

INSERT INTO `security_rules` (`security_group`, `direction`, `protocol`, `port_range`, `source`, `description`) VALUES
('jump', 'Inbound', 'tcp', '22', 'corporate', NULL),
('webapps', 'Inbound', 'tcp', '22', 'jump', NULL),
('webapps', 'Inbound', 'tcp', '443', 'corporate', NULL),
('dbs', 'Inbound', 'tcp', '22', 'jump', 'ssh access from jump'),
('dbs', 'Inbound', 'tcp', '5432', 'webapps', 'PGPool'),
('dbs', 'Inbound', 'tcp', '6379', 'jump', 'Logstash access'),
('jump', 'Inbound', 'tcp', '22', 'jump', NULL),
('jump', 'Inbound', 'tcp', '6379', 'corporate', 'Logstash'),
('jump', 'Inbound', 'tcp', '8080', 'corporate', 'Jenkins'),
('jump', 'Inbound', 'tcp', '8081', 'corporate', 'Jenkins'),
('jump', 'Inbound', 'tcp', '80', 'theWorld', 'It is in the PoC VPC'),
('dbs', 'Inbound', 'tcp', '5493', 'dbs', 'Postgresql server talking amongst themselves'),
('webapps', 'Inbound', 'tcp', '8443', 'corporate', 'To accommodate Apache redirects '),
('monitor', 'Inbound', 'tcp', '22', 'jump', NULL),
('monitor', 'Inbound', 'tcp', '5601', 'corporate', NULL),
('monitor', 'Inbound', 'tcp', '5044', 'webapps', 'Needed for ELK Stack'),
('monitor', 'Inbound', 'tcp', '9200', 'webapps', 'Needed for ELK Stack'),
('dbs', 'Inbound', 'tcp', '22', 'dbs', 'Allows backup script to talk to other db servers');

-- --------------------------------------------------------

--
-- Table structure for table `server_defs`
--

CREATE TABLE `server_defs` (
  `Server_id` varchar(10) CHARACTER SET ascii DEFAULT NULL,
  `Server_AMI` varchar(96) CHARACTER SET ascii DEFAULT NULL,
  `Instance_Type` varchar(32) CHARACTER SET ascii DEFAULT NULL COMMENT 't2.micro, m4.large,...',
  `Network` varchar(10) CHARACTER SET ascii DEFAULT 'Priv' COMMENT 'Pub1, Pub2, Priv',
  `mainStorage` int(11) NOT NULL,
  `Additional_Storage` int(11) NOT NULL DEFAULT '0' COMMENT 'Gb',
  `securityGroup` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT 'NOT Specified',
  `securityKey` varchar(32) CHARACTER SET ascii NOT NULL,
  `IPaddress` varchar(20) CHARACTER SET ascii DEFAULT NULL COMMENT 'If using fixed internal IP',
  `startScript` varchar(256) CHARACTER SET ascii DEFAULT NULL COMMENT 'script to run after server is created (use full path to script)'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `server_defs`
--

INSERT INTO `server_defs` (`Server_id`, `Server_AMI`, `Instance_Type`, `Network`, `mainStorage`, `Additional_Storage`, `securityGroup`, `securityKey`, `IPaddress`, `startScript`) VALUES
('jump', 'Jump - Hardened base Image', 't2.micro', 'pub1', 0, 0, 'jump', 'bastion', '10.0.0.132', NULL),
('jira', 'EngIT Hardened Image', 'm4.xlarge', 'pub2', 120, 0, 'webapps', 'jira-datacenter', '10.0.1.34', NULL),
('pgres1', 'EngIT_hardenedRHEL7_PostgreSQL9.3_PGPool3.5_v6', 'm4.xlarge', 'priv', 0, 100, 'dbs', 'jira-datacenter', '10.0.2.11', NULL),
('pgres2', 'EngIT_hardenedRHEL7_PostgreSQL9.3_PGPool3.5_v6', 'm4.xlarge', 'priv', 0, 100, 'dbs', 'jira-datacenter', '10.0.2.12', NULL),
('pgpool', 'EngIT_hardenedRHEL7_PostgreSQL9.3_PGPool3.5_v6', 'm4.xlarge', 'priv', 0, 100, 'dbs', 'jira-datacenter', '10.0.2.13', NULL),
('conf', 'EngIT Hardened Image', 'm4.xlarge', 'pub2', 200, 0, 'webapps', 'jira-datacenter', '10.0.1.64', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subnets`
--

CREATE TABLE `subnets` (
  `Name_id` varchar(10) CHARACTER SET ascii DEFAULT NULL,
  `cidr_base` varchar(20) CHARACTER SET ascii DEFAULT NULL,
  `cidr_range` varchar(2) CHARACTER SET ascii DEFAULT NULL,
  `public_net` tinyint(4) NOT NULL,
  `description` varchar(64) CHARACTER SET ascii DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subnets`
--

INSERT INTO `subnets` (`Name_id`, `cidr_base`, `cidr_range`, `public_net`, `description`) VALUES
('pub1', '10.0.0.0', '24', 1, 'Bastion/monitoring server subnet'),
('pub2', '10.0.1.0', '24', 1, 'Web application server subnet'),
('priv', '10.0.2.0', '24', 0, 'Private net for database servers');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `server_defs`
--
ALTER TABLE `server_defs`
  ADD UNIQUE KEY `Server_id` (`Server_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
