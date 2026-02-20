<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DevOps Learning | Pratyush</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            margin: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .card {
            background: #ffffff;
            width: 450px;
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(25px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .hero {
            text-align: center;
            margin-bottom: 30px;
        }

        .hero h1 {
            margin: 0;
            font-size: 26px;
            color: #222;
        }

        .hero h1 span {
            color: #2c5364;
        }

        .hero p {
            margin-top: 12px;
            font-size: 14px;
            color: #555;
            line-height: 1.6;
        }

        label {
            font-size: 14px;
            font-weight: 500;
            color: #333;
            display: block;
            margin-top: 15px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            border-radius: 8px;
            border: 1px solid #ddd;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        input:focus {
            border-color: #2c5364;
            box-shadow: 0 0 0 3px rgba(44, 83, 100, 0.2);
            outline: none;
        }

        .registerbtn {
            width: 100%;
            margin-top: 25px;
            padding: 14px;
            background: linear-gradient(135deg, #0f2027, #2c5364);
            color: #fff;
            border: none;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .registerbtn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(44, 83, 100, 0.4);
        }

        .terms {
            font-size: 12px;
            color: #666;
            margin-top: 15px;
            text-align: center;
        }

        .signin {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .footer-text {
            text-align: center;
            margin-top: 30px;
            color: #333;
        }

        .footer-text h2 {
            margin: 6px 0;
            font-size: 18px;
            font-weight: 600;
        }
    </style>
</head>

<body>

<div class="card">

    <!-- HERO SECTION -->
    <div class="hero">
        <h1>Welcome 👋 I’m <span>Pratyush</span></h1>
        <p>
            This is my DevOps learning space — built for curious minds who believe in
            <b>hands-on learning, real projects, and production-ready skills</b>.
            <br><br>
            Join me as we explore Cloud, CI/CD, Containers, Kubernetes, and modern DevOps practices 🚀
        </p>
    </div>

    <!-- FORM -->
    <form action="action_page.php" method="post">

        <label>Full Name</label>
        <input type="text" placeholder="Enter your full name" required>

        <label>Mobile Number</label>
        <input type="text" placeholder="Enter mobile number" required>

        <label>Email Address</label>
        <input type="email" placeholder="Enter email address" required>

        <label>Password</label>
        <input type="password" placeholder="Create a password" required>

        <label>Confirm Password</label>
        <input type="password" placeholder="Repeat password" required>

        <button type="submit" class="registerbtn">Start Learning 🚀</button>

        <p class="terms">
            By registering, you agree to the learning journey ahead.
        </p>
    </form>

    <div class="footer-text">
        <h2>Thank You ❤️</h2>
        <h2>Let’s Build, Learn & Grow Together</h2>
    </div>

</div>

</body>
</html>
