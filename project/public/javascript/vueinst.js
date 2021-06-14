var vm = new Vue({
  // options
  el:"#app",
  data:{
    login_type:"login"
  },
  methods:{
      login_type_switch: function(){
        if (login_type == "login")
        {
            login_type = "register";
        }
        else {
            login_type = "login";
        }
      }
  }
})