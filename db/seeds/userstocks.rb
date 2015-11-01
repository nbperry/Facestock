addUserStock = [
    {
        userStockID: "1",
        userID: "2",
        ticker: "AAPL",
        quantity: "1",
        stockMessages: "apples and bananas"
    },
    {
        userStockID: "1",
        userID: "2",
        ticker: "MSFT",
        quantity: "2",
        stockMessages: "macro hard micro soft"
    },
    {
        userStockID: "1",
        userID: "2",
        ticker: "GOOG",
        quantity: "3",
        stockMessages: "google"
    },
    {
        userStockID: "1",
        userID: "2",
        ticker: "TWTR",
        quantity: "1",
        stockMessages: "140"
    },
    {
        userStockID: "1",
        userID: "2",
        ticker: "FB",
        quantity: "2",
        stockMessages: "facestock"
    }
]

Userstock.delete_all
addUserStock.each do |addThis|
  Userstock.find_or_create_by!(addThis)
end