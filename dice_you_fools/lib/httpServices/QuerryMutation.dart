class QueryMutation {
  String addUser(String id, String name, String lastName, int age) {
    return """
      mutation{
          addPerson(id: "$id", name: "$name", lastName: "$lastName", age: $age){
            id
            name
            lastName
            age
          }
      }
    """;
  }

  String getAllUserQuery(){
    return """ 
      query listUser {
          listUsers{
          items{
            id
            name
            email
            phone
            jdrs
          }
        }
      }
    """;
  }

  String deleteUser(id){
    return """
      mutation{
        deletePerson(id: "$id"){
          id
        }
      } 
    """;
  }

  String editUser(String id, String name, String lastName, int age){
    return """
      mutation{
          editPerson(id: "$id", name: "$name", lastName: "$lastName", age: $age){
            name
            lastName
          }
      }    
     """;
  }
}