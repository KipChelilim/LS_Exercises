SELECT MAX("count")
  FROM (SELECT COUNT(id) FROM bids GROUP BY bidder_id) AS bid_counts;