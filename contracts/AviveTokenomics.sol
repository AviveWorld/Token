// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * AVIVE Tokenomics
 * The release schedule is as follows:

date	    Avive builder	Ecosystem	Partnership Development	Community	all
2024-05-01	0 	            39,000,000 	        29,000,000 	    162,000,000 	230,000,000 
2024-06-01	33,333,333 	    38,000,000 	        29,000,000 	    162,000,000 	262,333,333 
2024-07-01	33,333,333 	    39,000,000 	        29,000,000 	    162,000,000 	263,333,333 
2024-08-01	33,333,333 	    39,000,000 	        30,000,000 	    162,000,000 	264,333,333 
2024-09-01	33,333,333 	    39,000,000 	        29,000,000 	    162,000,000 	263,333,333 
2024-10-01	33,333,333 	    38,000,000 	        29,000,000 	    162,000,000 	262,333,333 
2024-11-01	33,333,333 	    39,000,000 	        29,000,000 	    162,000,000 	263,333,333 
2024-12-01	33,333,333 	    23,000,000 	        18,000,000 	    162,000,000 	236,333,333 
2025-01-01	33,333,333 	    24,000,000 	        17,000,000 	    162,000,000 	236,333,333 
2025-02-01	33,333,333 	    23,000,000 	        18,000,000 	    162,000,000 	236,333,333 
2025-03-01	33,333,333 	    23,000,000 	        17,000,000 	    162,000,000 	235,333,333 
2025-04-01	33,333,333 	    23,000,000 	        18,000,000 	    162,000,000 	236,333,333 
2025-05-01	33,333,333 	    24,000,000 	        17,000,000 	    162,000,000 	236,333,333 
2025-06-01	33,333,333 	    23,000,000 	        18,000,000 	    162,000,000 	236,333,333 
2025-07-01	33,333,333 	    23,000,000 	        17,000,000 	    162,000,000 	235,333,333 
2025-08-01	33,333,333 	    23,000,000 	        18,000,000 	    162,000,000 	236,333,333 
2025-09-01	33,333,333 	    24,000,000 	        17,000,000 	    162,000,000 	236,333,333 
2025-10-01	33,333,333 	    23,000,000 	        18,000,000 	    162,000,000 	236,333,333 
2025-11-01	33,333,333 	    23,000,000 	        17,000,000 	    162,000,000 	235,333,333 
2025-12-01	33,333,333 	    16,000,000 	        12,000,000 	    162,000,000 	223,333,333 
2026-01-01	33,333,333 	    15,000,000 	        11,000,000 	    126,000,000 	185,333,333 
2026-02-01	33,333,333 	    16,000,000 	        12,000,000 	    126,000,000 	187,333,333 
2026-03-01	33,333,333 	    15,000,000 	        12,000,000 	    126,000,000 	186,333,333 
2026-04-01	33,333,333 	    16,000,000 	        11,000,000 	    126,000,000 	186,333,333 
2026-05-01	33,333,333 	    15,000,000 	        12,000,000 	    126,000,000 	186,333,333 
2026-06-01	0 	            16,000,000 	        12,000,000 	    126,000,000 	154,000,000 
2026-07-01	0 	            15,000,000 	        11,000,000 	    126,000,000 	152,000,000 
2026-08-01	0 	            16,000,000 	        12,000,000 	    126,000,000 	154,000,000 
2026-09-01	0 	            15,000,000 	        12,000,000 	    126,000,000 	153,000,000 
2026-10-01	0 	            15,000,000 	        11,000,000 	    126,000,000 	152,000,000 
2026-11-01	0 	            16,000,000 	        12,000,000 	    126,000,000 	154,000,000 
2026-12-01	0 	            0 	                0 	            126,000,000 	126,000,000 
2027-01-01	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-02-01	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-03-01	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-04-01	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-05-01	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-06-01	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-07-01	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-08-01	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-09-01	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-10-01	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-11-01	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-12-01	0 	            0 	                0 	            78,000,000 	    78,000,000 
2028-01-01	0 	            0 	                0 	            33,000,000 	    33,000,000 
2028-02-01	0 	            0 	                0 	            32,000,000 	    32,000,000 
2028-03-01	0 	            0 	                0 	            33,000,000 	    33,000,000 
2028-04-01	0 	            0 	                0 	            33,000,000 	    33,000,000 
2028-05-01	0 	            0 	                0 	            33,000,000 	    33,000,000 
2028-06-01	0 	            0 	                0 	            32,000,000 	    32,000,000 
2028-07-01	0 	            0 	                0 	            33,000,000 	    33,000,000 
2028-08-01	0 	            0 	                0 	            33,000,000 	    33,000,000 
2028-09-01	0 	            0 	                0 	            33,000,000 	    33,000,000 
2028-10-01	0 	            0 	                0 	            32,000,000 	    32,000,000 
2028-11-01	0 	            0 	                0 	            33,000,008 	    33,000,008
 */

/**
 * @title AviveTokenomics
 * @author Avive
 * @notice Contract for releasing Avive tokens on a monthly basis
 */
contract AviveTokenomics is Ownable {
  IERC20 public aviveToken;

  struct Release {
    uint256 time;
    uint256 amount;
    bool released;
  }

  event LogReleased(uint8 round, uint256 amount);

  // Release tokens for 60 months
  uint256 constant totalMonths = 60;

  // Mapping of release schedule
  // The key is the round number, total 60 rounds
  mapping(uint256 => Release) public releaseSchedule;

  /**
   * @notice Constructor
   * @param _owner the owner of the contract, should be the Avive multisig account. It shouldn't be the deployer, only safe multisig account
   * @param _aviveToken the address of the Avive token
   */
  constructor(address _owner, IERC20 _aviveToken) Ownable(_owner) {
    aviveToken = _aviveToken;

    // Define release times and amounts following the tokenomics
    uint256[] memory _releaseTimes = new uint256[](totalMonths);
    uint256[] memory _releaseAmounts = new uint256[](totalMonths);
    // round 1 2023-12-01T00:00:00Z 942,000,000
    _releaseTimes[0] = 1701388800;
    _releaseAmounts[0] = 942000000 ether;
    // round 2 2024-01-01T00:00:00Z 230,000,000
    _releaseTimes[1] = 1704067200;
    _releaseAmounts[1] = 230000000 ether;
    // round 3 2024-02-01T00:00:00Z 230,000,000
    _releaseTimes[2] = 1706745600;
    _releaseAmounts[2] = 230000000 ether;
    // round 4 2024-03-01T00:00:00Z 230,000,000
    _releaseTimes[3] = 1709251200;
    _releaseAmounts[3] = 230000000 ether;
    // round 5 2024-04-01T00:00:00Z 230,000,000
    _releaseTimes[4] = 1711929600;
    _releaseAmounts[4] = 230000000 ether;
    // round 6 2024-05-01T00:00:00Z 230,000,000
    _releaseTimes[5] = 1714521600;
    _releaseAmounts[5] = 230000000 ether;
    // round 7 2024-06-01T00:00:00Z 262,333,333
    _releaseTimes[6] = 1717200000;
    _releaseAmounts[6] = 262333333 ether;
    // round 8 2024-07-01T00:00:00Z 263,333,333
    _releaseTimes[7] = 1719792000;
    _releaseAmounts[7] = 263333333 ether;
    // round 9 2024-08-01T00:00:00Z 264,333,333
    _releaseTimes[8] = 1722470400;
    _releaseAmounts[8] = 264333333 ether;
    // round 10 2024-09-01T00:00:00Z 263,333,333
    _releaseTimes[9] = 1725148800;
    _releaseAmounts[9] = 263333333 ether;
    // round 11 2024-10-01T00:00:00Z 262,333,333
    _releaseTimes[10] = 1727740800;
    _releaseAmounts[10] = 262333333 ether;
    // round 12 2024-11-01T00:00:00Z 263,333,333
    _releaseTimes[11] = 1730419200;
    _releaseAmounts[11] = 263333333 ether;
    // round 13 2024-12-01T00:00:00Z 236,333,333
    _releaseTimes[12] = 1733011200;
    _releaseAmounts[12] = 236333333 ether;
    // round 14 2025-01-01T00:00:00Z 236,333,333
    _releaseTimes[13] = 1735689600;
    _releaseAmounts[13] = 236333333 ether;
    // round 15 2025-02-01T00:00:00Z 236,333,333
    _releaseTimes[14] = 1738368000;
    _releaseAmounts[14] = 236333333 ether;
    // round 16 2025-03-01T00:00:00Z 235,333,333
    _releaseTimes[15] = 1740787200;
    _releaseAmounts[15] = 235333333 ether;
    // round 17 2025-04-01T00:00:00Z 236,333,333
    _releaseTimes[16] = 1743465600;
    _releaseAmounts[16] = 236333333 ether;
    // round 18 2025-05-01T00:00:00Z 236,333,333
    _releaseTimes[17] = 1746057600;
    _releaseAmounts[17] = 236333333 ether;
    // round 19 2025-06-01T00:00:00Z 236,333,333
    _releaseTimes[18] = 1748736000;
    _releaseAmounts[18] = 236333333 ether;
    // round 20 2025-07-01T00:00:00Z 235,333,333
    _releaseTimes[19] = 1751328000;
    _releaseAmounts[19] = 235333333 ether;
    // round 21 2025-08-01T00:00:00Z 236,333,333
    _releaseTimes[20] = 1754006400;
    _releaseAmounts[20] = 236333333 ether;
    // round 22 2025-09-01T00:00:00Z 236,333,333
    _releaseTimes[21] = 1756684800;
    _releaseAmounts[21] = 236333333 ether;
    // round 23 2025-10-01T00:00:00Z 236,333,333
    _releaseTimes[22] = 1759276800;
    _releaseAmounts[22] = 236333333 ether;
    // round 24 2025-11-01T00:00:00Z 235,333,333
    _releaseTimes[23] = 1761955200;
    _releaseAmounts[23] = 235333333 ether;
    // round 25 2025-12-01T00:00:00Z 223,333,333
    _releaseTimes[24] = 1764547200;
    _releaseAmounts[24] = 223333333 ether;
    // round 26 2026-01-01T00:00:00Z 185,333,333
    _releaseTimes[25] = 1767225600;
    _releaseAmounts[25] = 185333333 ether;
    // round 27 2026-02-01T00:00:00Z 187,333,333
    _releaseTimes[26] = 1769904000;
    _releaseAmounts[26] = 187333333 ether;
    // round 28 2026-03-01T00:00:00Z 186,333,333
    _releaseTimes[27] = 1772323200;
    _releaseAmounts[27] = 186333333 ether;
    // round 29 2026-04-01T00:00:00Z 186,333,333
    _releaseTimes[28] = 1775001600;
    _releaseAmounts[28] = 186333333 ether;
    // round 30 2026-05-01T00:00:00Z 186,333,333
    _releaseTimes[29] = 1777593600;
    _releaseAmounts[29] = 186333333 ether;
    // round 31 2026-06-01T00:00:00Z 154,000,000
    _releaseTimes[30] = 1780272000;
    _releaseAmounts[30] = 154000000 ether;
    // round 32 2026-07-01T00:00:00Z 152,000,000
    _releaseTimes[31] = 1782864000;
    _releaseAmounts[31] = 152000000 ether;
    // round 33 2026-08-01T00:00:00Z 154,000,000
    _releaseTimes[32] = 1785542400;
    _releaseAmounts[32] = 154000000 ether;
    // round 34 2026-09-01T00:00:00Z 153,000,000
    _releaseTimes[33] = 1788220800;
    _releaseAmounts[33] = 153000000 ether;
    // round 35 2026-10-01T00:00:00Z 152,000,000
    _releaseTimes[34] = 1790812800;
    _releaseAmounts[34] = 152000000 ether;
    // round 36 2026-11-01T00:00:00Z 154,000,000
    _releaseTimes[35] = 1793491200;
    _releaseAmounts[35] = 154000000 ether;
    // round 37 2026-12-01T00:00:00Z 126,000,000
    _releaseTimes[36] = 1796083200;
    _releaseAmounts[36] = 126000000 ether;
    // round 38 2027-01-01T00:00:00Z 78,000,000
    _releaseTimes[37] = 1798761600;
    _releaseAmounts[37] = 78000000 ether;
    // round 39 2027-02-01T00:00:00Z 78,000,000
    _releaseTimes[38] = 1801440000;
    _releaseAmounts[38] = 78000000 ether;
    // round 40 2027-03-01T00:00:00Z 78,000,000
    _releaseTimes[39] = 1803859200;
    _releaseAmounts[39] = 78000000 ether;
    // round 41 2027-04-01T00:00:00Z 78,000,000
    _releaseTimes[40] = 1806537600;
    _releaseAmounts[40] = 78000000 ether;
    // round 42 2027-05-01T00:00:00Z 78,000,000
    _releaseTimes[41] = 1809129600;
    _releaseAmounts[41] = 78000000 ether;
    // round 43 2027-06-01T00:00:00Z 78,000,000
    _releaseTimes[42] = 1811808000;
    _releaseAmounts[42] = 78000000 ether;
    // round 44 2027-07-01T00:00:00Z 78,000,000
    _releaseTimes[43] = 1814400000;
    _releaseAmounts[43] = 78000000 ether;
    // round 45 2027-08-01T00:00:00Z 78,000,000
    _releaseTimes[44] = 1817078400;
    _releaseAmounts[44] = 78000000 ether;
    // round 46 2027-09-01T00:00:00Z 78,000,000
    _releaseTimes[45] = 1819756800;
    _releaseAmounts[45] = 78000000 ether;
    // round 47 2027-10-01T00:00:00Z 78,000,000
    _releaseTimes[46] = 1822348800;
    _releaseAmounts[46] = 78000000 ether;
    // round 48 2027-11-01T00:00:00Z 78,000,000
    _releaseTimes[47] = 1825027200;
    _releaseAmounts[47] = 78000000 ether;
    // round 49 2027-12-01T00:00:00Z 78,000,000
    _releaseTimes[48] = 1827619200;
    _releaseAmounts[48] = 78000000 ether;
    // round 50 2028-01-01T00:00:00Z 33,000,000
    _releaseTimes[49] = 1830297600;
    _releaseAmounts[49] = 33000000 ether;
    // round 51 2028-02-01T00:00:00Z 32,000,000
    _releaseTimes[50] = 1832976000;
    _releaseAmounts[50] = 32000000 ether;
    // round 52 2028-03-01T00:00:00Z 33,000,000
    _releaseTimes[51] = 1835481600;
    _releaseAmounts[51] = 33000000 ether;
    // round 53 2028-04-01T00:00:00Z 33,000,000
    _releaseTimes[52] = 1838160000;
    _releaseAmounts[52] = 33000000 ether;
    // round 54 2028-05-01T00:00:00Z 33,000,000
    _releaseTimes[53] = 1840752000;
    _releaseAmounts[53] = 33000000 ether;
    // round 55 2028-06-01T00:00:00Z 32,000,000
    _releaseTimes[54] = 1843430400;
    _releaseAmounts[54] = 32000000 ether;
    // round 56 2028-07-01T00:00:00Z 33,000,000
    _releaseTimes[55] = 1846022400;
    _releaseAmounts[55] = 33000000 ether;
    // round 57 2028-08-01T00:00:00Z 33,000,000
    _releaseTimes[56] = 1848700800;
    _releaseAmounts[56] = 33000000 ether;
    // round 58 2028-09-01T00:00:00Z 33,000,000
    _releaseTimes[57] = 1851379200;
    _releaseAmounts[57] = 33000000 ether;
    // round 59 2028-10-01T00:00:00Z 32,000,000
    _releaseTimes[58] = 1853971200;
    _releaseAmounts[58] = 32000000 ether;
    // round 60 2028-11-01T00:00:00Z 33,000,008
    _releaseTimes[59] = 1856649600;
    _releaseAmounts[59] = 33000008 ether;

    for (uint256 i = 0; i < _releaseTimes.length; i++) {
      // The first 5 months are already settled
      bool isReleased = _releaseTimes[i] < _releaseTimes[5] ? true : false;
      // Set release schedule
      releaseSchedule[i + 1] = Release(
        _releaseTimes[i],
        _releaseAmounts[i],
        isReleased
      );
    }
  }

  /**
   * @notice Release tokens for a specific round. Only the mulitisig owner can call this function
   * @param round the round number to release
   */
  function releaseByMonth(uint256 round) external onlyOwner {
    Release storage release = releaseSchedule[round];
    require(block.timestamp >= release.time, "Release time not reached");
    require(round <= totalMonths, "Invalid round");
    require(!release.released, "Already released");
    require(release.amount > 0, "No tokens to release");
    require(
      aviveToken.balanceOf(address(this)) >= release.amount,
      "Not enough tokens to release"
    );

    aviveToken.transfer(owner(), release.amount);
    release.released = true;
    emit LogReleased(round, release.amount);
  }
}
