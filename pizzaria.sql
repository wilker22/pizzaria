-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Jul-2024 às 23:02
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pizzaria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_07_02_173852_create_pizzas_table', 2),
(7, '2024_07_03_131257_create_orders_table', 3),
(8, '2024_07_03_171151_add_phone_to_orders', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pizza_id` int(11) NOT NULL,
  `small_pizza` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medium_pizza` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `large_pizza` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pendente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `date`, `time`, `pizza_id`, `small_pizza`, `medium_pizza`, `large_pizza`, `body`, `status`, `created_at`, `updated_at`, `phone`) VALUES
(1, 3, '05/04/2024', '08:00', 2, '0', '2', '0', 'Uma pizza, com borda de catupiry', 'aceito', '2024-07-03 14:01:45', '2024-07-03 18:02:38', '(87)98827-3964');

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pizzas`
--

CREATE TABLE `pizzas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `small_pizza_price` int(11) NOT NULL,
  `medium_pizza_price` int(11) NOT NULL,
  `large_pizza_price` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pizzas`
--

INSERT INTO `pizzas` (`id`, `name`, `description`, `small_pizza_price`, `medium_pizza_price`, `large_pizza_price`, `category`, `image`, `created_at`, `updated_at`) VALUES
(1, 'teste', 'teste', 23, 23, 23, 'tradicional', 'pizza/4WfrlhJHTPIecZjQUoqRLHZ793JULWJ94NZJ4PGn.jpg', '2024-07-02 19:00:03', '2024-07-02 23:51:11'),
(2, 'Pizza Pepperone', 'Pizza pepperoni', 50, 60, 80, 'tradicional', 'pizza/dNxgKhNPa8EfqjnR5neKoV4tetEWRjnU0VBv8vTc.jpg', '2024-07-02 22:02:41', '2024-07-03 21:14:00'),
(3, 'Pizza Mussarela', 'Pizza Mussarela', 50, 60, 80, 'tradicional', 'pizza/q1UC7fDMUHfSP4VrfhnQGagKRVrqSBmnshtD15eb.jpg', '2024-07-02 22:05:44', '2024-07-03 21:14:16'),
(4, 'Pizza Quatro Queijos', 'Quator Querihos', 55, 66, 77, 'tradicional', 'pizza/FhX9BN6rY8FzVVGgYCPbmSPV0cOKyul1D39t2xXO.png', '2024-07-02 22:11:25', '2024-07-03 21:14:28'),
(7, 'teste', 'teste', 23, 23, 23, 'tradicional', 'pizza/4WfrlhJHTPIecZjQUoqRLHZ793JULWJ94NZJ4PGn.jpg', '2024-07-02 19:00:03', '2024-07-02 23:51:11'),
(8, 'Pizza Pepperone', 'Pizza pepperoni', 50, 60, 80, 'tradicional', 'pizza/NHs9hCtvcFhe3gcuIIsrqhpptKQoXXaaCBmTMm6i.jpg', '2024-07-02 22:02:41', '2024-07-02 22:02:41'),
(9, 'Pizza Mussarela', 'Pizza Mussarela', 50, 60, 80, 'tradicional', 'public/pizza/WOoNKPy7JgatEIC7ufFNCoBLj7TuzARQdeWfolnI.jpg', '2024-07-02 22:05:44', '2024-07-02 23:46:18'),
(10, 'Pizza Quatro Queijos', 'Quator Querihos', 55, 66, 77, 'tradicional', 'pizza/rMHwT9tiNEjIkmKn36Ni1s300qQ2k4WRftQUh4VB.jpg', '2024-07-02 22:11:25', '2024-07-02 22:11:25'),
(11, 'teste', 'teste', 23, 23, 23, 'tradicional', 'pizza/4WfrlhJHTPIecZjQUoqRLHZ793JULWJ94NZJ4PGn.jpg', '2024-07-02 19:00:03', '2024-07-02 23:51:11'),
(12, 'Pizza Pepperone', 'Pizza pepperoni', 50, 60, 80, 'tradicional', 'pizza/NHs9hCtvcFhe3gcuIIsrqhpptKQoXXaaCBmTMm6i.jpg', '2024-07-02 22:02:41', '2024-07-02 22:02:41'),
(13, 'Pizza Mussarela', 'Pizza Mussarela', 50, 60, 80, 'tradicional', 'public/pizza/WOoNKPy7JgatEIC7ufFNCoBLj7TuzARQdeWfolnI.jpg', '2024-07-02 22:05:44', '2024-07-02 23:46:18'),
(14, 'Pizza Quatro Queijos', 'Quator Querihos', 55, 66, 77, 'tradicional', 'pizza/rMHwT9tiNEjIkmKn36Ni1s300qQ2k4WRftQUh4VB.jpg', '2024-07-02 22:11:25', '2024-07-02 22:11:25'),
(15, 'teste', 'teste', 23, 23, 23, 'tradicional', 'pizza/4WfrlhJHTPIecZjQUoqRLHZ793JULWJ94NZJ4PGn.jpg', '2024-07-02 19:00:03', '2024-07-02 23:51:11'),
(16, 'Pizza Pepperone', 'Pizza pepperoni', 50, 60, 80, 'tradicional', 'pizza/NHs9hCtvcFhe3gcuIIsrqhpptKQoXXaaCBmTMm6i.jpg', '2024-07-02 22:02:41', '2024-07-02 22:02:41'),
(17, 'Pizza Mussarela', 'Pizza Mussarela', 50, 60, 80, 'tradicional', 'public/pizza/WOoNKPy7JgatEIC7ufFNCoBLj7TuzARQdeWfolnI.jpg', '2024-07-02 22:05:44', '2024-07-02 23:46:18'),
(18, 'Pizza Quatro Queijos', 'Quator Querihos', 55, 66, 77, 'tradicional', 'pizza/rMHwT9tiNEjIkmKn36Ni1s300qQ2k4WRftQUh4VB.jpg', '2024-07-02 22:11:25', '2024-07-02 22:11:25'),
(19, 'teste', 'teste', 23, 23, 23, 'tradicional', 'pizza/4WfrlhJHTPIecZjQUoqRLHZ793JULWJ94NZJ4PGn.jpg', '2024-07-02 19:00:03', '2024-07-02 23:51:11'),
(20, 'Pizza Pepperone', 'Pizza pepperoni', 50, 60, 80, 'tradicional', 'pizza/NHs9hCtvcFhe3gcuIIsrqhpptKQoXXaaCBmTMm6i.jpg', '2024-07-02 22:02:41', '2024-07-02 22:02:41'),
(21, 'Pizza Mussarela', 'Pizza Mussarela', 50, 60, 80, 'tradicional', 'public/pizza/WOoNKPy7JgatEIC7ufFNCoBLj7TuzARQdeWfolnI.jpg', '2024-07-02 22:05:44', '2024-07-02 23:46:18'),
(22, 'Pizza Quatro Queijos', 'Quator Querihos', 55, 66, 77, 'tradicional', 'pizza/rMHwT9tiNEjIkmKn36Ni1s300qQ2k4WRftQUh4VB.jpg', '2024-07-02 22:11:25', '2024-07-02 22:11:25'),
(23, 'teste', 'teste', 23, 23, 23, 'tradicional', 'pizza/4WfrlhJHTPIecZjQUoqRLHZ793JULWJ94NZJ4PGn.jpg', '2024-07-02 19:00:03', '2024-07-02 23:51:11'),
(24, 'Pizza Pepperone', 'Pizza pepperoni', 50, 60, 80, 'tradicional', 'pizza/NHs9hCtvcFhe3gcuIIsrqhpptKQoXXaaCBmTMm6i.jpg', '2024-07-02 22:02:41', '2024-07-02 22:02:41'),
(25, 'Pizza Mussarela', 'Pizza Mussarela', 50, 60, 80, 'tradicional', 'public/pizza/WOoNKPy7JgatEIC7ufFNCoBLj7TuzARQdeWfolnI.jpg', '2024-07-02 22:05:44', '2024-07-02 23:46:18'),
(26, 'Pizza Quatro Queijos', 'Quator Querihos', 55, 66, 77, 'tradicional', 'pizza/rMHwT9tiNEjIkmKn36Ni1s300qQ2k4WRftQUh4VB.jpg', '2024-07-02 22:11:25', '2024-07-02 22:11:25'),
(27, 'teste', 'teste', 23, 23, 23, 'tradicional', 'pizza/4WfrlhJHTPIecZjQUoqRLHZ793JULWJ94NZJ4PGn.jpg', '2024-07-02 19:00:03', '2024-07-02 23:51:11'),
(28, 'Pizza Pepperone', 'Pizza pepperoni', 50, 60, 80, 'tradicional', 'pizza/NHs9hCtvcFhe3gcuIIsrqhpptKQoXXaaCBmTMm6i.jpg', '2024-07-02 22:02:41', '2024-07-02 22:02:41'),
(29, 'Pizza Mussarela', 'Pizza Mussarela', 50, 60, 80, 'tradicional', 'public/pizza/WOoNKPy7JgatEIC7ufFNCoBLj7TuzARQdeWfolnI.jpg', '2024-07-02 22:05:44', '2024-07-02 23:46:18'),
(30, 'Pizza Quatro Queijos', 'Quator Querihos', 55, 66, 77, 'tradicional', 'pizza/rMHwT9tiNEjIkmKn36Ni1s300qQ2k4WRftQUh4VB.jpg', '2024-07-02 22:11:25', '2024-07-02 22:11:25'),
(31, 'teste', 'teste', 23, 23, 23, 'tradicional', 'pizza/4WfrlhJHTPIecZjQUoqRLHZ793JULWJ94NZJ4PGn.jpg', '2024-07-02 19:00:03', '2024-07-02 23:51:11'),
(32, 'Pizza Pepperone', 'Pizza pepperoni', 50, 60, 80, 'tradicional', 'pizza/NHs9hCtvcFhe3gcuIIsrqhpptKQoXXaaCBmTMm6i.jpg', '2024-07-02 22:02:41', '2024-07-02 22:02:41'),
(33, 'Pizza Mussarela', 'Pizza Mussarela', 50, 60, 80, 'tradicional', 'public/pizza/WOoNKPy7JgatEIC7ufFNCoBLj7TuzARQdeWfolnI.jpg', '2024-07-02 22:05:44', '2024-07-02 23:46:18'),
(34, 'Pizza Quatro Queijos', 'Quator Querihos', 55, 66, 77, 'tradicional', 'pizza/rMHwT9tiNEjIkmKn36Ni1s300qQ2k4WRftQUh4VB.jpg', '2024-07-02 22:11:25', '2024-07-02 22:11:25'),
(35, 'Pizza Especial', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unkno', 50, 70, 90, 'vegana', 'pizza/HogdCBqnFae3xw3hmMpVFBoyi1Wfn9lBOhMzqjtQ.jpg', '2024-07-03 21:16:06', '2024-07-03 21:16:06');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'wilker', 'wilker@admin.com', NULL, '$2y$12$C7AbiFN6ahGa.UzGWRPvWet.lUveSbsV7pWiFpcCDLSsUgCU1q8jW', 0, 'O8b8uos8FAHbADwqe32AEquWot2mZcix8Jm37GyH17VdvGJmkQYSoNc6Zf8L', '2024-07-02 17:38:22', '2024-07-02 17:38:22'),
(2, 'admin', 'admin@admin.com', NULL, '$2y$12$eDgi2v3iTvtjTNEYomxgq.14rdDivc6hUtoE586XHXM2L2GLsAYrO', 1, NULL, '2024-07-03 15:37:43', '2024-07-03 15:37:43'),
(3, 'Cliente1', 'cliente1@gmail.com', NULL, '$2y$12$q1luKb.cKtNnWwCwxA2SNuX8layzBvIZehNTzYzenBRsa7QNixmvW', 0, NULL, '2024-07-03 17:00:47', '2024-07-03 17:00:47'),
(4, 'Cliente2', 'cliente2@gmail.com', NULL, '$2y$12$TjNMR8rPnF6dPw0w2ebqWuY0Fs8hMBM3urO6uq/jWkeJXci.G7gP6', 0, NULL, '2024-07-03 22:30:18', '2024-07-03 22:30:18');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Índices para tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices para tabela `pizzas`
--
ALTER TABLE `pizzas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pizzas`
--
ALTER TABLE `pizzas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
