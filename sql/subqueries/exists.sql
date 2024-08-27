SELECT name
  FROM bidders
 WHERE EXISTS
      (SELECT 1 FROM bids WHERE bidder_id = bidders.id);