// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * AVIVE Tokenomics
 * The release schedule is as follows:

date	    Avive builder	Ecosystem	Partnership Development	Community	    Total
2023-12-31	0 	            109,000,000         329,000,000     504,000,000 	942,000,000 
2024-01-31	0 	            39,000,000 	        29,000,000 	    162,000,000 	230,000,000 
2024-02-29	0 	            38,000,000 	        30,000,000 	    162,000,000 	230,000,000 
2024-03-31	0 	            39,000,000 	        29,000,000 	    162,000,000 	230,000,000 
2024-04-30	0 	            39,000,000 	        29,000,000 	    162,000,000 	230,000,000 
2024-05-31	0 	            39,000,000 	        29,000,000 	    162,000,000 	230,000,000 
2024-06-30	33,333,333 	    38,000,000 	        29,000,000 	    162,000,000 	262,333,333 
2024-07-31	33,333,333 	    39,000,000 	        29,000,000 	    162,000,000 	263,333,333 
2024-08-31	33,333,333 	    39,000,000 	        30,000,000 	    162,000,000 	264,333,333 
2024-09-30	33,333,333 	    39,000,000 	        29,000,000 	    162,000,000 	263,333,333 
2024-10-31	33,333,333 	    38,000,000 	        29,000,000 	    162,000,000 	262,333,333 
2024-11-30	33,333,333 	    39,000,000 	        29,000,000 	    162,000,000 	263,333,333 
2024-12-31	33,333,333 	    23,000,000 	        18,000,000 	    162,000,000 	236,333,333 
2025-01-31	33,333,333 	    24,000,000 	        17,000,000 	    162,000,000 	236,333,333 
2025-02-28	33,333,333 	    23,000,000 	        18,000,000 	    162,000,000 	236,333,333 
2025-03-31	33,333,333 	    23,000,000 	        17,000,000 	    162,000,000 	235,333,333 
2025-04-30	33,333,333 	    23,000,000 	        18,000,000 	    162,000,000 	236,333,333 
2025-05-31	33,333,333 	    24,000,000 	        17,000,000 	    162,000,000 	236,333,333 
2025-06-30	33,333,333 	    23,000,000 	        18,000,000 	    162,000,000 	236,333,333 
2025-07-31	33,333,333 	    23,000,000 	        17,000,000 	    162,000,000 	235,333,333 
2025-08-31	33,333,333 	    23,000,000 	        18,000,000 	    162,000,000 	236,333,333 
2025-09-30	33,333,333 	    24,000,000 	        17,000,000 	    162,000,000 	236,333,333 
2025-10-31	33,333,333 	    23,000,000 	        18,000,000 	    162,000,000 	236,333,333 
2025-11-30	33,333,333 	    23,000,000 	        17,000,000 	    162,000,000 	235,333,333 
2025-12-31	33,333,333 	    16,000,000 	        12,000,000 	    162,000,000 	223,333,333 
2026-01-31	33,333,333 	    15,000,000 	        11,000,000 	    126,000,000 	185,333,333 
2026-02-28	33,333,333 	    16,000,000 	        12,000,000 	    126,000,000 	187,333,333 
2026-03-31	33,333,333 	    15,000,000 	        12,000,000 	    126,000,000 	186,333,333 
2026-04-30	33,333,333 	    16,000,000 	        11,000,000 	    126,000,000 	186,333,333 
2026-05-31	33,333,333 	    15,000,000 	        12,000,000 	    126,000,000 	186,333,333 
2026-06-30	0 	            16,000,000 	        12,000,000 	    126,000,000 	154,000,000 
2026-07-31	0 	            15,000,000 	        11,000,000 	    126,000,000 	152,000,000 
2026-08-31	0 	            16,000,000 	        12,000,000 	    126,000,000 	154,000,000 
2026-09-30	0 	            15,000,000 	        12,000,000 	    126,000,000 	153,000,000 
2026-10-31	0 	            15,000,000 	        11,000,000 	    126,000,000 	152,000,000 
2026-11-30	0 	            16,000,000 	        12,000,000 	    126,000,000 	154,000,000 
2026-12-31	0 	            0 	                0 	            126,000,000 	126,000,000 
2027-01-31	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-02-28	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-03-31	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-04-30	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-05-31	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-06-30	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-07-31	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-08-31	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-09-30	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-10-31	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-11-30	0 	            0 	                0 	            78,000,000 	    78,000,000 
2027-12-31	0 	            0 	                0 	            78,000,000 	    78,000,000 
2028-01-31	0 	            0 	                0 	            33,000,000 	    33,000,000 
2028-02-29	0 	            0 	                0 	            32,000,000 	    32,000,000 
2028-03-31	0 	            0 	                0 	            33,000,000 	    33,000,000 
2028-04-30	0 	            0 	                0 	            33,000,000 	    33,000,000 
2028-05-31	0 	            0 	                0 	            33,000,000 	    33,000,000 
2028-06-30	0 	            0 	                0 	            32,000,000 	    32,000,000 
2028-07-31	0 	            0 	                0 	            33,000,000 	    33,000,000 
2028-08-31	0 	            0 	                0 	            33,000,000 	    33,000,000 
2028-09-30	0 	            0 	                0 	            33,000,000 	    33,000,000 
2028-10-31	0 	            0 	                0 	            32,000,000 	    32,000,000 
2028-11-30	0 	            0 	                0 	            33,000,008 	    33,000,008
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

  uint256 constant totalMonths = 60;

  // Mapping of release schedule
  // The key is the round number, total 60 rounds
  mapping(uint256 => Release) public releaseSchedule;

  constructor(address _owner, IERC20 _aviveToken) Ownable(_owner) {
    aviveToken = _aviveToken;

    // Define release times and amounts following the tokenomics
    uint256[] memory _releaseTimes = new uint256[](totalMonths);
    uint256[] memory _releaseAmounts = new uint256[](totalMonths);
    // round 1 2023-12-31T00:00:00Z 942,000,000
    _releaseTimes[0] = 1703980800;
    _releaseAmounts[0] = 942000000 ether;
    // round 2 2024-01-31T00:00:00Z 230,000,000
    _releaseTimes[1] = 1706659200;
    _releaseAmounts[1] = 230000000 ether;
    // round 3 2024-02-29T00:00:00Z 230,000,000
    _releaseTimes[2] = 1709164800;
    _releaseAmounts[2] = 230000000 ether;
    // round 4 2024-03-31T00:00:00Z 230,000,000
    _releaseTimes[3] = 1711843200;
    _releaseAmounts[3] = 230000000 ether;
    // round 5 2024-04-30T00:00:00Z 230,000,000
    _releaseTimes[4] = 1714435200;
    _releaseAmounts[4] = 230000000 ether;
    // round 6 2024-05-31T00:00:00Z 230,000,000
    _releaseTimes[5] = 1717113600;
    _releaseAmounts[5] = 230000000 ether;
    // round 7 2024-06-30T00:00:00Z 262,333,333
    _releaseTimes[6] = 1719705600;
    _releaseAmounts[6] = 262333333 ether;
    // round 8 2024-07-31T00:00:00Z 263,333,333
    _releaseTimes[7] = 1722384000;
    _releaseAmounts[7] = 263333333 ether;
    // round 9 2024-08-31T00:00:00Z 264,333,333
    _releaseTimes[8] = 1725062400;
    _releaseAmounts[8] = 264333333 ether;
    // round 10 2024-09-30T00:00:00Z 263,333,333
    _releaseTimes[9] = 1727654400;
    _releaseAmounts[9] = 263333333 ether;
    // round 11 2024-10-31T00:00:00Z 262,333,333
    _releaseTimes[10] = 1730332800;
    _releaseAmounts[10] = 262333333 ether;
    // round 12 2024-11-30T00:00:00Z 263,333,333
    _releaseTimes[11] = 1732924800;
    _releaseAmounts[11] = 263333333 ether;
    // round 13 2024-12-31T00:00:00Z 236,333,333
    _releaseTimes[12] = 1735603200;
    _releaseAmounts[12] = 236333333 ether;
    // round 14 2025-01-31T00:00:00Z 236,333,333
    _releaseTimes[13] = 1738281600;
    _releaseAmounts[13] = 236333333 ether;
    // round 15 2025-02-28T00:00:00Z 236,333,333
    _releaseTimes[14] = 1740700800;
    _releaseAmounts[14] = 236333333 ether;
    // round 16 2025-03-31T00:00:00Z 235,333,333
    _releaseTimes[15] = 1743379200;
    _releaseAmounts[15] = 235333333 ether;
    // round 17 2025-04-30T00:00:00Z 236,333,333
    _releaseTimes[16] = 1745971200;
    _releaseAmounts[16] = 236333333 ether;
    // round 18 2025-05-31T00:00:00Z 236,333,333
    _releaseTimes[17] = 1748649600;
    _releaseAmounts[17] = 236333333 ether;
    // round 19 2025-06-30T00:00:00Z 236,333,333
    _releaseTimes[18] = 1751241600;
    _releaseAmounts[18] = 236333333 ether;
    // round 20 2025-07-31T00:00:00Z 235,333,333
    _releaseTimes[19] = 1753920000;
    _releaseAmounts[19] = 235333333 ether;
    // round 21 2025-08-31T00:00:00Z 236,333,333
    _releaseTimes[20] = 1756598400;
    _releaseAmounts[20] = 236333333 ether;
    // round 22 2025-09-30T00:00:00Z 236,333,333
    _releaseTimes[21] = 1759190400;
    _releaseAmounts[21] = 236333333 ether;
    // round 23 2025-10-31T00:00:00Z 236,333,333
    _releaseTimes[22] = 1761868800;
    _releaseAmounts[22] = 236333333 ether;
    // round 24 2025-11-30T00:00:00Z 235,333,333
    _releaseTimes[23] = 1764460800;
    _releaseAmounts[23] = 235333333 ether;
    // round 25 2025-12-31T00:00:00Z 223,333,333
    _releaseTimes[24] = 1767139200;
    _releaseAmounts[24] = 223333333 ether;
    // round 26 2026-01-31T00:00:00Z 185,333,333
    _releaseTimes[25] = 1769817600;
    _releaseAmounts[25] = 185333333 ether;
    // round 27 2026-02-28T00:00:00Z 187,333,333
    _releaseTimes[26] = 1772236800;
    _releaseAmounts[26] = 187333333 ether;
    // round 28 2026-03-31T00:00:00Z 186,333,333
    _releaseTimes[27] = 1774915200;
    _releaseAmounts[27] = 186333333 ether;
    // round 29 2026-04-30T00:00:00Z 186,333,333
    _releaseTimes[28] = 1777507200;
    _releaseAmounts[28] = 186333333 ether;
    // round 30 2026-05-31T00:00:00Z 186,333,333
    _releaseTimes[29] = 1780185600;
    _releaseAmounts[29] = 186333333 ether;
    // round 31 2026-06-30T00:00:00Z 154,000,000
    _releaseTimes[30] = 1782777600;
    _releaseAmounts[30] = 154000000 ether;
    // round 32 2026-07-31T00:00:00Z 152,000,000
    _releaseTimes[31] = 1785456000;
    _releaseAmounts[31] = 152000000 ether;
    // round 33 2026-08-31T00:00:00Z 154,000,000
    _releaseTimes[32] = 1788134400;
    _releaseAmounts[32] = 154000000 ether;
    // round 34 2026-09-30T00:00:00Z 153,000,000
    _releaseTimes[33] = 1790726400;
    _releaseAmounts[33] = 153000000 ether;
    // round 35 2026-10-31T00:00:00Z 152,000,000
    _releaseTimes[34] = 1793404800;
    _releaseAmounts[34] = 152000000 ether;
    // round 36 2026-11-30T00:00:00Z 154,000,000
    _releaseTimes[35] = 1795996800;
    _releaseAmounts[35] = 154000000 ether;
    // round 37 2026-12-31T00:00:00Z 126,000,000
    _releaseTimes[36] = 1798675200;
    _releaseAmounts[36] = 126000000 ether;
    // round 38 2027-01-31T00:00:00Z 78,000,000
    _releaseTimes[37] = 1801353600;
    _releaseAmounts[37] = 78000000 ether;
    // round 39 2027-02-28T00:00:00Z 78,000,000
    _releaseTimes[38] = 1803772800;
    _releaseAmounts[38] = 78000000 ether;
    // round 40 2027-03-31T00:00:00Z 78,000,000
    _releaseTimes[39] = 1806451200;
    _releaseAmounts[39] = 78000000 ether;
    // round 41 2027-04-30T00:00:00Z 78,000,000
    _releaseTimes[40] = 1809043200;
    _releaseAmounts[40] = 78000000 ether;
    // round 42 2027-05-31T00:00:00Z 78,000,000
    _releaseTimes[41] = 1811721600;
    _releaseAmounts[41] = 78000000 ether;
    // round 43 2027-06-30T00:00:00Z 78,000,000
    _releaseTimes[42] = 1814313600;
    _releaseAmounts[42] = 78000000 ether;
    // round 44 2027-07-31T00:00:00Z 78,000,000
    _releaseTimes[43] = 1816992000;
    _releaseAmounts[43] = 78000000 ether;
    // round 45 2027-08-31T00:00:00Z 78,000,000
    _releaseTimes[44] = 1819670400;
    _releaseAmounts[44] = 78000000 ether;
    // round 46 2027-09-30T00:00:00Z 78,000,000
    _releaseTimes[45] = 1822262400;
    _releaseAmounts[45] = 78000000 ether;
    // round 47 2027-10-31T00:00:00Z 78,000,000
    _releaseTimes[46] = 1824940800;
    _releaseAmounts[46] = 78000000 ether;
    // round 48 2027-11-30T00:00:00Z 78,000,000
    _releaseTimes[47] = 1827532800;
    _releaseAmounts[47] = 78000000 ether;
    // round 49 2027-12-31T00:00:00Z 78,000,000
    _releaseTimes[48] = 1830211200;
    _releaseAmounts[48] = 78000000 ether;
    // round 50 2028-01-31T00:00:00Z 33,000,000
    _releaseTimes[49] = 1832889600;
    _releaseAmounts[49] = 33000000 ether;
    // round 51 2028-02-29T00:00:00Z 32,000,000
    _releaseTimes[50] = 1835395200;
    _releaseAmounts[50] = 32000000 ether;
    // round 52 2028-03-31T00:00:00Z 33,000,000
    _releaseTimes[51] = 1838073600;
    _releaseAmounts[51] = 33000000 ether;
    // round 53 2028-04-30T00:00:00Z 33,000,000
    _releaseTimes[52] = 1840665600;
    _releaseAmounts[52] = 33000000 ether;
    // round 54 2028-05-31T00:00:00Z 33,000,000
    _releaseTimes[53] = 1843344000;
    _releaseAmounts[53] = 33000000 ether;
    // round 55 2028-06-30T00:00:00Z 32,000,000
    _releaseTimes[54] = 1845936000;
    _releaseAmounts[54] = 32000000 ether;
    // round 56 2028-07-31T00:00:00Z 33,000,000
    _releaseTimes[55] = 1848614400;
    _releaseAmounts[55] = 33000000 ether;
    // round 57 2028-08-31T00:00:00Z 33,000,000
    _releaseTimes[56] = 1851292800;
    _releaseAmounts[56] = 33000000 ether;
    // round 58 2028-09-30T00:00:00Z 33,000,000
    _releaseTimes[57] = 1853884800;
    _releaseAmounts[57] = 33000000 ether;
    // round 59 2028-10-31T00:00:00Z 32,000,000
    _releaseTimes[58] = 1856563200;
    _releaseAmounts[58] = 32000000 ether;
    // round 60 2028-11-30T00:00:00Z 33,000,008
    _releaseTimes[59] = 1859155200;
    _releaseAmounts[59] = 33000008 ether;

    for (uint i = 0; i < _releaseTimes.length; i++) {
      // The first 4 months are already settled
      bool isReleased = _releaseTimes[i] < _releaseTimes[4] ? true : false;
      // Set release schedule
      releaseSchedule[i + 1] = Release(
        _releaseTimes[i],
        _releaseAmounts[i],
        isReleased
      );
    }
  }

  function releaseByMonth(uint8 round) external onlyOwner {
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
