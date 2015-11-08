addUser = [
    {
        provider: "Me",
        uid: "12341234",
        name: "Test Me",
        image: "1",
        token: "test"
    },
    {
        provider: "You",
        uid: "123123123",
        name: "Test You",
        image: "1",
        token: "testtesttesttesttest"
    },
    {
        provider: "Asdf Yeah",
        uid: "000000000",
        name: "Dinosaur",
        image: "",
        token: "testtesttest"
    },
    {
        provider: "Thisisatest",
        uid: "1010101010",
        name: "Test",
        image: "1",
        token: "okaythisisatoken"
    },
    {
        provider: "RubyOffTheRails",
        uid: "01010101010101",
        name: "laskdjaslkdj",
        image: "askdjalskdjalksjd",
        token: "lkasjdlaskdjalskdj"
    }
]

User.delete_all
addUser.each do |addThis|
  User.find_or_create_by!(addThis)
end