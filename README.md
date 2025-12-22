# CodeAlpha_Polling-System-Smart-Contract

📌 Overview

This project is a Polling System Smart Contract built using Solidity.
It allows users to create polls, vote securely, and view the final winner only after the voting period ends.

This project was completed as part of Task 3 of the CodeAlpha Blockchain Internship.

----------------------------------------------------------------
🎯 Features

Create polls with a title, multiple options, and a time limit

Each Ethereum address can vote only once

Voting is blocked after the deadline

Results can be viewed only after voting ends

Uses mappings for secure vote storage

-----------------------------------------------------------------
🧠 Design Choices Explained

✅ Why mapping(address => bool)?

To prevent double voting

Each address is tracked once it votes

✅ Why block.timestamp?

To enforce time-based voting

Ensures fairness and automatic poll closure

✅ Why option index (0,1,2)?

Efficient way to track votes

Saves gas compared to strings

----------------------------------------------
🛠️ Technologies Used

Solidity ^0.8.0

Remix IDE

Remix VM (London)

------------------------------------------------
🚀 How to Deploy the Contract

Open Remix IDE

Create a new file: PollingSystem.sol

Paste the contract code

Compile using Solidity ^0.8.0

Go to Deploy & Run Transactions

Select Remix VM (London)

Click Deploy

--------------------------------------------------
📝 How to Create a Poll

Use the createPoll function.
Example:

Title: Favorite Food

Options: ["Briyani", "Paratoo", "Fried Rice"]

Duration: 5 (minutes)

After creation:

Poll ID will be 1

------------------------------------------------------
🗳️ How to Vote

Use the vote function.
<img width="913" height="467" alt="image" src="https://github.com/user-attachments/assets/a2517c1d-aa43-4191-b52d-69ec0bbf05f9" />
📌 Switch accounts in Remix before each vote.

----------------------------------------------------------
⏰ Important Rule

Voting is allowed only before the deadline

Voting after the deadline will revert

-------------------------------------------------------------
🏁 How to Check Final Result

After the poll duration ends:

Call getWinner

Enter the poll ID (1)

View output in the Remix console

Example Output:
"Briyani"

--------------------------------------------------------------------------
📊 Example Result Summary

Poll Title: Favorite Food
Total Votes: 5

Option	Votes
Briyani	3
Paratoo	1
Fried Rice	1
🏆 Winner: Briyani

-------------------------------------------------------------------
✅ Conclusion

This project demonstrates:

Secure voting logic

Time-based restrictions

Smart use of mappings

Beginner-friendly Solidity design

It helped me understand real-world smart contract behavior and improved my confidence in blockchain development.


