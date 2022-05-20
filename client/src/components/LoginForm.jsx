import React, { useState } from "react";
import Login from "./Login";

export default function LoginForm({ userLogin }) {
  const [user, setUser] = useState({ name: "", email: "" });
  const onLogin = (userInfo) => {
    userLogin(userInfo, () => {
      console.log("CALLBACK");
    }).then((res) => {
      console.log("RESULT", res);
      setUser({ name: res.data.name, email: res.data.email });
    });
  };

  const logout = () => {
    setUser({ email: "" });
  };

  return (
    <div className="App">
      {user.email !== "" ? (
        <div>
          <h2>
            Welcome, <span>{user.email}</span>
          </h2>
          <button onClick={logout}>Logout</button>
        </div>
      ) : (
        <Login userLogin={onLogin} />
      )}
    </div>
  );
}
