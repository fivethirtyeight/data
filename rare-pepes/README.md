# Rare Pepes

This folder contains data behind the story [Can The Blockchain Turn Pepe The Frog Into Modern Art?](https://fivethirtyeight.com/features/pepe-the-frog-symbolism-cryptoart-blockchain/) There are four data files, described below. You can also find further information about individual Rare Pepe assets at [Rare Pepe Wallet](https://rarepepewallet.com/feed).

`ordermatches_all.csv` contains all Rare Pepe order matches from the beginning of the project, in late 2016, until Feb. 3. All order matches include a pair of assets (a “forward asset” and a “backward asset”) one of which is a Rare Pepe and the other of which is either XCP, the native [Counterparty](https://counterparty.io/) token, or Pepe Cash. The time of the order match can be determined by the block.

Header | Definition
---|---------
`Block` | The block number
`ForwardAsset` | The type of forward asset
`ForwardQuantity` | The quantity of forward asset
`BackwardAsset` | The type of backward asset
`BackwardQuantity` | The quantity of backward asset

`blocks_timestamps.csv` is a pairing of block and timestamp. This can be used to determine the actual time an order match occurred, which can then be used to determine the dollar value of Pepe Cash or XCP at the time of the trade.

Header | Definition
---|---------
`Block` | The block number
`Timestamp` | A Unix timestamp

`pepecash_prices.csv` contains the dollar price of Pepe Cash over time.

Header | Definition
---|---------
`Timestamp` | A Unix timestamp
`Price` | The price of Pepe Cash in dollars

`xcp_prices.csv` contains the dollar price of XCP over time.

Header | Definition
---|---------
`Timestamp` | A Unix timestamp
`Price` | The price of XCP in dollars


Source: [Rare Pepe Foundation](http://rarepepefoundation.com/)
