-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 01 oct. 2023 à 19:21
-- Version du serveur : 8.0.30
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `task`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230930112048', '2023-09-30 11:20:52', 159);

-- --------------------------------------------------------

--
-- Structure de la table `liste`
--

CREATE TABLE `liste` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `liste`
--

INSERT INTO `liste` (`id`, `user_id`, `titre`) VALUES
(6, 6, 'test'),
(10, 4, 'test'),
(12, 7, 'listes courses'),
(13, 7, 'shopping'),
(14, 7, 'anniversaire'),
(15, 7, 'Noel'),
(16, 7, 'Nouvel an'),
(17, 7, 'impot');

-- --------------------------------------------------------

--
-- Structure de la table `refresh_tokens`
--

CREATE TABLE `refresh_tokens` (
  `id` int NOT NULL,
  `refresh_token` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `refresh_tokens`
--

INSERT INTO `refresh_tokens` (`id`, `refresh_token`, `username`, `valid`) VALUES
(1, '58154d945241a02220300903b77a513705e70787136300b31b5940c72737a57f85cbbfd4cebea51d6f4ab726421cfb9dad0eb66e6228435e42ad1f98c9d83039', 'demo2@demo.com', '2023-10-30 13:47:14'),
(2, '14728dd835ebb792e2cd3fc7fb390565934a508a0ac1ed51bcb1d560c75f73be2710a4fb56a01d35bdaf3d65f121c957dc871b7a3c692cac51020f2985cd0069', 'demo4@demo.com', '2023-10-30 13:49:26'),
(6, '3b46b673f5ac8010ee683b7beccd4b45504bf47c01c230e6c840041ea1c84873de042cde8566bc4164e31397e949efd7de421f1ff1b714afa77df6ea03a5152b', 'demo2@demo.com', '2023-10-30 14:54:11'),
(7, 'bd54939c3ecc2c860f0fd9faf5ee2fb10772358a114196c9494fd879e7cd8523b7ec13127a9d85bf5ac207e07acc691159fbd4d40b4960933d0b0238e2236502', 'demo2@demo.com', '2023-10-30 14:55:02'),
(8, '98d9f2965d0f1762a75627df25831aaa021edd11c62173ff098a75bd7db2989efcddd4611ac768f238fbc5da9ff4581ef2d888e844f00dfd5fa461a7f46bb050', 'demo@demo.com', '2023-10-30 14:57:35'),
(9, 'a584b401e7bd72068aff40fea7c9af77f9f22dcb3edfab7f3e6db73fb96dbcf6dc1e262b99f02600603f8f865c27b05bffbcbdcc497123a9fe506c4479eb506e', 'demo@demo.com', '2023-10-30 14:58:00'),
(10, 'f001470afa9795185cf2f77bd12ab08a5cd7a77c3c170a6ce872141c7f5c0f54bbc52d33da9501ea1ea05a425791953b9e4466efe577c7d933286619a390155f', 'demo@demo.com', '2023-10-30 14:58:59'),
(11, '753e0004145ea368dc23d936f365148f4331a92d6c42cfdfacd0803364ba8cffd4b170279db835bcaea3a14abc6199bb56b1bd21a1153dd25689ab113b4610ee', 'demo@demo.com', '2023-10-30 15:08:28'),
(12, 'babed508cf5515aa8bd68aed4221b9ef2b4c39959d638ce459af7f23e62bd80997add6af981bd0db8ef32fa665cfd5afa9067cd94405db9f02463deab5fe7072', 'demo@demo.com', '2023-10-30 15:10:13'),
(13, '26dba96938e8a2fb5a8182b2e575a020e86af8ea9fdce9d640861225a197b6fa10b6dd2ab484b8cefdef4d86bd0672c960e92deacb467ff492459d963e46db94', 'demo@demo.com', '2023-10-30 15:27:46'),
(14, 'ee7342d47b97256e96ab8ce7036dc9d577ff3bf7ae4da37f0ac14eb9e97dfda70d836385d3aa3cc8b5b4e9549b0c908a23a017abef260fc2572dade131d34154', 'demo@demo.com', '2023-10-30 15:29:44'),
(15, 'fe96f05af8b365e098e87bbee6de92a8747a5a0b12c972ead71e53e15425531c686a10f8a5a099f6cbb8dcfd03adda5ff88eff337facbfc8320c2d1cc46caf80', 'demo@demo.com', '2023-10-30 15:31:34'),
(16, '07e4fb24fd8dde37ac7732b297005d3dd4402a5687b60f55aea78d11c653264ec759c023866f04757fe1f5780806963cfba7b338cc1b1c1a5fab3ed2a9925c8a', 'demo@demo.com', '2023-10-30 15:32:24'),
(17, '9f8c318607ef016f44f8e5f11716a9245af89841a83690660ecea3dc849f25f0a843e254db7eab4e1672f6cc2efd8cfb39a7dc761196aa3bb920eab95a8b20fe', 'demo@demo.com', '2023-10-30 15:36:18'),
(18, 'a3d94317054ab2801e41cf3ce1ca503ccbbad8b33246c75d3be611387fcf1edb982775f135567e7f8314a653d4e59dd8e57c58e8e5738ee72e45f09c2c212dc1', 'demo@demo.com', '2023-10-30 15:37:26'),
(19, 'ac967fa28d9c26eb1adee78d1b5a6db578f5f2a811efee85f768a38270433c023621515dc74c1b80cc80a297b2a02e06ce26c4068c342f8adf38cb8ff0a92b7e', 'demo@demo.com', '2023-10-30 15:38:43'),
(20, '2572bbd4c8d9b0c16927d77609b65406bf9c722db72c1a1fe4ad2f77eca9066461dc9b8d2c038926b5c363b8d75e9c81137eb3baecc4a0f13b1171dcf9ea75b1', 'demo@demo.com', '2023-10-30 16:11:02'),
(21, '0b24195ebbefada437401facfa4be6c1aea176c72041ced7d093cacc979d998f94c855287f513452dd3ba70f0eb83e9580320774915ae3c4483500f39d3dfb4a', 'demo@demo.com', '2023-10-30 16:12:48'),
(22, '6d97a2dc9b4da82184f2c96a1413c31262f31b160cb22ffe289ef2a553803f2b80a517354d14305ccce90e253be680efe757ae132314553fd7861a9719969c55', 'demo@demo.com', '2023-10-30 16:13:26'),
(23, 'c12e3496812db571ead6f508d53abe9cb5b740e8fddff61ed8e3f897da799a2e3e3c1317cb8d52040972f40ea46996565cc293c61fef92256dec21d8424bfe0b', 'demo@demo.com', '2023-10-30 16:14:17'),
(24, 'd07175cff72dfe0b7bece4c543dcab84389562376d92d9979c68b39a75611c9513df8d563429ae48e642fbc2ec5eb77e71015f2e816c9b1ea8767847493de755', 'demo@demo.com', '2023-10-30 16:19:28'),
(25, 'ce70c7868048c16adf56184e25c788f8f1d4c53ed49cff9bddc48ad550683898247189c842ca9a76cfb1df1cb160d167876283047c0f52b44b3f6ba6ea0473ad', 'demo@demo.com', '2023-10-30 16:37:16'),
(26, 'b3143ab8f5957ebfbc785e2e70fbded345540eacd49e5ebf18d5993a27755f7a768da27850d21e8abe0be7e4a83bc6b1e75d23d242bbd46a5797878c144b344c', 'demo@demo.com', '2023-10-30 16:37:52'),
(27, '072c2e99bdab19a2947aa36b4bb7ac8d0f15e30b631e649160a97e5b5e1c553058e7fd8a1d01280aecca3e3cd2073904593abbaa2528904a9d36b8309240b9ea', 'demo@demo.com', '2023-10-30 16:37:59'),
(28, '7c10d94f9eb86bb4b38feb8eafb7338f19ddce32e8f309abdb16cb730a249131bb00c5aa6c766e1bb0f079b7e463222bf4b518f74ad000d992c1304ce0e46c6c', 'demo@demo.com', '2023-10-30 16:38:57'),
(29, '214592ef6cf6d569a3a2c8e03f09b20a78b5e456857afa569372b8549e329a1693a35a2822f0a377e6045d0fd603d24b9cb0beeebea4d39a6d5c910b3850b9c6', 'demo@demo.com', '2023-10-30 16:56:24'),
(30, 'a22f3a84c814bf181ed51cd00b391f97d8ccd40a167ecdce8ced9b9bb62d904411ddd8fc37842258136d9eb5fc295e5d07d0386870b271ce2d0e3298744793c2', 'demo@demo.com', '2023-10-30 16:58:47'),
(31, '284fb1556bd6e4d63c854363da0376b2be8fbed374e1199319efddb4aa0c5af6d6649525f81e08c9535be4e41fc57068ee46ef5809f04da9253e2b71b0934673', 'demo@demo.com', '2023-10-30 17:00:15'),
(32, '9a308a508fffb11523eaa674095fe768de955f815ae063a844b4afec32fb29736dc59a9b0b7783b528ca3c8f146cfa6f58a40e89bfcf655ebd7e2aaafe674ce2', 'demo@demo.com', '2023-10-30 17:11:14'),
(33, 'ad96cc06c46dd5aa0b8e85e1b0c340c1ce5358de7d5852d257acc0645b47708a995de8315810db11fdd89334e6931b50b30a8a104e11f03595d3a038eef10123', 'demo@demo.com', '2023-10-30 17:12:53'),
(34, 'a4beabe3f50fa738966d4bd6e9c48b480b2261239724e8012fde7e62b26c37cd83a97f4b367cd64a31b4fa5da9788753ad556cb729666b7a7704e939fe4106e9', 'demo@demo.com', '2023-10-30 17:14:48'),
(35, '63bae850532bac6b225af0b9c4109f5714d5a12d9009514339f4414246bca9295a84ebea5cd5cf9cfdb655e4358b256407d9a706d8b9eed5dfbfedd04eb48e89', 'demo@demo.com', '2023-10-30 17:15:20'),
(36, 'aac1afabe0af81dc48d028071d0d99e2c2fdc2d82a69bd04a09fc6adc58050a8dfa05bdab7c9a1a0fca067bc5f3cd770aa78e86ae44779afc36cf12d312b4bf0', 'demo@demo.com', '2023-10-30 17:23:59'),
(37, '04557136988d5c8cd3fb00a931c8bc1da57e8e5057c176bf07af7dfe8bef3503cc35555481d71e52430d79a8ae10933f7475ce6a71d20c4bf89604cc41f69eb8', 'demo@demo.com', '2023-10-30 17:25:48'),
(38, '9065172e362c86b03d4e606b50f168a202aef4b2522920d65cf3d3913acf93cb6623a1e3ff77568e9f5eb9afd3d46de0750598dafbc4da5a55ff6be2fae02438', 'demo@demo.com', '2023-10-30 17:26:45'),
(39, 'd7423a5ce3bfbfda078e39964b26509ac6ba0fe169a3a8e01872dd23edaedefadae8f1db1478df255b41103e548e8ba56e4068e1942b12794e37d500386e4b53', 'demo@demo.com', '2023-10-30 17:46:43'),
(40, '7d14c77a4c5bf6bd49d6de94cb42f6b1fe4a79cbd30adffc565c0068e9bc61c6265b64b52bc1202bba6e1b0a732886b9b86d38412d458418d341306ef9b30b22', 'demo@demo.com', '2023-10-30 18:08:19'),
(41, 'cd283cee73a3a6541a28f833882dd200f2c106c1b4c8f484e9bb111832dee1b646ffb88c70e9c5c64344dc186d27255eea7a94352aa38d7a7db27fdc7c5e5266', 'demo@demo.com', '2023-10-30 19:15:05'),
(42, '08a13d7984b12abdc355bf5518af740822400ddf48c06274eb8b333bea5a663fcb23d2f903333428ac6d97d8428b4e08379bc6353bd747f73482658821573d4d', 'demo@demo.com', '2023-10-30 19:18:16'),
(43, '16bc114924986a9a2d3c0875bf29b1f1f1ce83775ab2f160acff26178ae7585e8f53fdee241e20ffcad5779144d2dbf65aa6339be0d0ec0589070601589b2700', 'demo@demo.com', '2023-10-30 19:19:37'),
(44, '784dc4e3983665b3be2e75416a2e006dcaf5bbf2881aec7a9aa78b60424ec91780811585d34fe83345266e587264bbbed97dccf004376e785a3d002057483a4c', 'demo@demo.com', '2023-10-30 19:20:47'),
(45, '039857f1db2156217f6bb87ffdba3fb19c858d520142d0acd07c3e0e63607514735c6f759fcce83120a665e006738b9d23d76ea91157929f8863082699efe481', 'demo@demo.com', '2023-10-30 19:26:28'),
(46, '9d549c47402915e7531424e8daaaba573c1a902b40e042490261d534213ce78428a0170eb8c860dd323daeb256024bb27f6ab66fd0d82512ceac52912d1d4ca5', 'demo@demo.com', '2023-10-30 19:26:31'),
(47, 'f92408bfbc7f6a9bb312f6762e89405f25496a0cd93f5df7fc61a313e98f3804cb8d34b687796cf2b744393b36d6ef3ac70d0ff470ccb46c726d60cac77f752a', 'demo@demo.com', '2023-10-30 19:26:58'),
(48, '84b22ecd0a06adc2f794ed04b4841b97ff570cc8642e0f81c24f1175e056394da518f416423ff14e0c7182ceb7ea2401aefd57810c3351904426d84561f48461', 'demo@demo.com', '2023-10-30 19:32:49'),
(49, 'e874fcfeae56b3f4ae67e0de54f553afb7b6d8497c4c677c5f801b243b3cdff93ecda55d04ecadf38a31ca3aeae3ba71c12b38e886a5e5bb29bcb40f90d4a614', 'demo@demo.com', '2023-10-30 19:33:45'),
(50, 'c2f7d1f91db316f3f02b8c105c7e6a76c23d7abe3f61879f5a9f3c9a6dbb5ad077cb4f9affbae22c46dfb2a5448a1ced41f5883c8485325c3382da93d64e7a38', 'demo@demo.com', '2023-10-30 20:01:29'),
(51, '62e3764078da521ca15a60e497356ce50b76e5111e2e59404605b26ad0bf2c04962c85b13e1863e97fd0e183e62376587e3bd31e6053fce7d2a677cde7473197', 'demo@demo.com', '2023-10-30 20:05:46'),
(52, 'ae0e307807848135894a9a63076bcadad24062819e880bce68ce6f9e2a799700e4c26e80031d0804c7d8a5f862f81d1af6a6eababf9bfcb95f1d6c159b8c6308', 'demo@demo.com', '2023-10-30 20:15:12'),
(53, '421015264b35d4b38dbcbaedc03fa5c1d00fcb19d9989e3cc2aa0d7a3557464b33ba540aa55a178b10b567bc956dd8af4ddb7aff3c3eeda6bfa2bd93ee6326ff', 'demo@demo.com', '2023-10-30 20:15:14'),
(54, '2ef1ba6fdb8cfef42c2ca4c5d3c6bc1014d4d5b9b4a605610f5ab5a8153a34f07640226476c7a1ce6dbc65a5755001965b199e7e52f87890a12ca8f834844bcf', 'demo@demo.com', '2023-10-30 20:18:05'),
(55, 'f39fb8d91f34cb23e51c04b1cda2ebe05eb80654ff8721afff0de782db7cea35d71dfe6121f0e9ff42fedbb16ab66efd9865c78c2f66066f9a9e3d4078682a23', 'demo@demo.com', '2023-10-30 20:19:33'),
(56, '714764d7ed72a61894333326fcb2a45d3d129b4e9cec0857fdf08a2dd257dc904550691bb93eff03a9100b3d46472b491751b31e8df8501373b6806744a34e6f', 'demo@demo.com', '2023-10-30 20:22:38'),
(57, '320b439603012dd320111aeb356e53951760b53f3b11f27b7528bb57bcf79ee1ba311acb74a7472c26d59e724a01a14e52d96c4ef99bc33b6b0cbcab7c645a2e', 'demo@demo.com', '2023-10-30 20:27:39'),
(58, 'ae907ea8945daedb616e3fe0dfd217aa5aeec43c9b471c558e6c0cdfb7acc95a0ace8552baecb87e0f7f0056e93330cdca5ecb97a0d047460db15a2c763317b0', 'demo@demo.com', '2023-10-30 20:29:16'),
(59, '5e836298be42a9c078cc34ba995a66ff2f64a28ee6dbcf2f0a99d018e8b859b06353f271d7295a7f1495a8fbc46e8d34bdcd4432563d05f3b58437267b612599', 'demo@demo.com', '2023-10-30 20:48:15'),
(60, 'cd038469afdab25589bf0d7aad6bf109dfb2f153f8cae668e454fbd47413c9ada6367d6b71fba123fdf876f2355c9fb786e48c0090fecf80fd432b90018411a2', 'demo@demo.com', '2023-10-30 21:06:36'),
(61, '520f946a915ba2469642ba87f43c16adaa5116dc1127242df3f1758838163350a56750bca12cb72684c083dfc28d0d58bfe417dbd3784605584ea951a9744f1b', 'demo@demo.com', '2023-10-30 21:07:57'),
(62, '99a1d5f822aec65c132762813933a730335151b567dee1de330cd28eca8fc2d79c7560ec9ce611b41195b712ee302193bad1cd006d3dd3dc1b86eab5efb5ff55', 'demo@demo.com', '2023-10-30 21:18:34'),
(63, 'f7d91cfe9924d64ca0a2230b8e2b2bce5e1a10c61f10d6755cdd94a2c75464b402c79b80a38c4bedf31eb65cfc31743df1165b62ee0ca4a46bf8dc60dfca0b13', 'demo@demo.com', '2023-10-30 21:18:37'),
(64, '54c6b88c3f5e346dde8214f320d50e0d61932ea0334e954f71021f34ce6c4bfabb52bce32e0112f7f71da4a9e18746b2b1a4cdf39e1c958f18bc09232b3ef48b', 'demo@demo.com', '2023-10-30 21:18:38'),
(65, 'c9c72b0e3521a79029ad132240c8a49125ad9cc9a106ee731c784135abaaec0d99c010357405519506f41a6075ead26e9584e4dbcb3fa07724158689db7d12ec', 'demo@demo.com', '2023-10-30 21:54:47'),
(66, 'fe04fdbcbea30d2d98b69ef5cbd537843244354ebff31a02e217d31440c025c0f6c9ffed7988aec71a026ce3a5600ffe56b43e25bf1dcc474d910f6fe3cdaf05', 'demo@demo.com', '2023-10-30 21:54:50'),
(67, '4f4a56baa1a92130d74d9708ce90d8521ed604d2f4571da6711aef3a05130d172987bafbe4ce4cc39453a160eee13020bad5670b4c39a664802466541d4186f8', 'demo@demo.com', '2023-10-30 21:57:36'),
(68, 'e7404e5452152238111a27cca1a305f75064dc2ef323959c624894cbffdb3b7005768cd1d3a7909f5b50320a35a8447dd6604b55fe7d33ce591b9fb62d21a01b', 'demo@demo.com', '2023-10-30 21:57:39'),
(69, '67f89fd3f18adb27c4562402e0984b8b77de1fc983cded3f8e9bdab3d67d54a75897d17a9adac97c698d8cc04c46d92be0396ff07b38f72ae67077c3ab0ca8c4', 'demo@demo.com', '2023-10-30 22:22:51'),
(70, '49880bc6a23ef4b53d345a725b5e6be7461695098229bbdf5c0a379b1bc3e2d8775da401c042674206062f565e6fba609e6d598e603cc337a51e21445eaa2747', 'demo@demo.com', '2023-10-30 22:26:50'),
(71, '0a00e35246b20d511106486230460555a0cb69902a3adaeee0bc3b23e39c5cc8ece2cacfa02b42c90070f9ce2840c645ab5f3b5f8fb261a4ecb0f168810f3d7c', 'demo@demo.com', '2023-10-30 22:31:05'),
(72, '2228da46e576c34a4d517af5adcee58565d2b9318586e79647c44458e0c711c7cc866b0cd96d66b90a0b83f4d4d6178515a6fa9b93fc7f5b076123810f9f3666', 'demo@demo.com', '2023-10-30 22:31:47'),
(73, '1db151c1b1dc5f96ef4f44b2612dbd78aca1d45fccbddaff5a6bfe78462081eb1573c378dbb38bfa412c88193a1c261e5aaaa98a3c1254059f3ceb41f8aedc8e', 'demo@demo.com', '2023-10-30 22:51:25'),
(74, 'e7e76ca5b50bb8b08ad3886afeead490959061ee9443c82cf66cfae97b6a3b8cdedeca5e2c5da3a91520abedb3ad3a146b75c155b6bf74fdaa8171742c1fcffe', 'demo@demo.com', '2023-10-30 22:51:27'),
(75, '30745ad6f7db93f2f668ca8fd1eef4da39e68aa9c1f1b39f80a24be931642d1c7093244c0a8a1006d4aa9c14a74f9043241b8a2d1fd3334290f693c70fd2ea09', 'demo@demo.com', '2023-10-30 22:52:04'),
(76, '1d8a44772a08603bfa71ebeaa45e6ab97db74c11cdc253adf73e1530ec358f82862314e1d9bba0c235c6ac4cdc88131b44021c992e228cd394252fc781a3a1a7', 'demo@demo.com', '2023-10-30 22:52:06'),
(77, '5c5262707bd5b580e9ac57fcf331414a2aeecad91cdfc11ea4189e3a92ed584bf3faca8032bfa1b76a7dba5dc1a24c8470f3d98775eccd444a1117121df7b219', 'demo@demo.com', '2023-10-30 22:57:06'),
(78, '251c0f424ccafabc8a40b3467ec6a3dd826275a78cd50ea40d522af3518f9a080b472f26452341e66284cd7cffffd8b24042744ae462a508f0719608ae870945', 'demo@demo.com', '2023-10-30 23:00:16'),
(79, 'a47409c5138427610079e01d1d70572da2cde22f9004921ea94918db503005ef167b8963bc203ad6491a43eca158c442b2d81545e33a07eb99367489120281a6', 'demo@demo.com', '2023-10-30 23:00:18'),
(80, '0f72005cad53c6e86136b943514666c440a875ac86a660e15ed33b79876c52ed3c9308912928b10749c3a5382bbae5af7b9b0fd1870a4a2a5cf2567316bf95e2', 'demo@demo.com', '2023-10-30 23:00:42'),
(81, '9a730db3789c5d3ea71388a84c3cec644c5200f39128af92da01148404e944ee9c40437a3886a0258a7e558a71a19685c1d49312f019c45e32ec9c1cee02ca7e', 'demo@demo.com', '2023-10-30 23:01:28'),
(82, 'e19ba385c4b0299282ac1b9551bc96e43a648f9e36ccf1eda2d1c3f150e0d2811e499f9eaa6fddcb192ebddae47ff4184bf010a4779cb42bc4342619a7b143c8', 'demo@demo.com', '2023-10-30 23:03:19'),
(83, 'a8e4f49319b69220c97743e098e97bde063ca5169f62aa149c363558699a8c3720c62d199c3c7aaaa7035c91ca664e68103d9b650b08fd98fc21dff31a6d252d', 'demo@demo.com', '2023-10-30 23:07:45'),
(84, 'bc15dd6d77eee0544beaf723a1e14898115528c89de4278d80c27b7503675cca0386da747e7cdaed73124a7479b35a553d377e62d35daf8630ebd9b771057ee9', 'demo@demo.com', '2023-10-30 23:07:48'),
(85, 'a5c002dec4b380806b02af6d52941572ce32d2861775a51af435df5591700da18266601e245daa44a5b3b3bcf7588117eb6891e41e0d8dd3461d9442635d8e08', 'demo@demo.com', '2023-10-30 23:13:54'),
(86, '4e5c768e1ff1680abb55d8c7eb84e52038cb10cef28c4344a4312875d25b66c60ae004e38626fe83f46b37e95b24dd8d7a6e59c9ab5b17fb8713a6297c5f1d53', 'demo@demo.com', '2023-10-30 23:14:26'),
(87, '581f2da8efd15c4a321c6d6ae4ce9186e42063919ed69d3edb3e300cfd12b80b182825352064386ff5fe4be6be2c0db13de459fcd3714cee69a137cce5a192e6', 'demo@demo.com', '2023-10-30 23:17:49'),
(88, '7c8cc25458f7deb4a61fbfe625a00911d8312f30c4777aac4053526fd30b7a727b16a1cce9b57a51f137c913da5f6a1b36f3dfe78b7635d1a1cd516888f499fb', 'demo@demo.com', '2023-10-30 23:39:22'),
(89, '5cd0b839eab7ab92d6883f70b72ce0d3ef4caf5b96af194c14bf74baf9b5cd30db6793c062801ad7b7d40a2587dd179c2ff2af56e8522c190944ec15cc7533f5', 'demo@demo.com', '2023-10-30 23:49:37'),
(90, 'c745ec262ed804d1c6b681ae927ecabbcc6431cf74797ac98fd005825f47b8d05cbf2c72aa6a5d7aef06cdcdecda80c49c0890c7af92e5deb2455428965fac08', 'demo@demo.com', '2023-10-31 01:14:15'),
(91, '0d16a9a9aa4fdda6bbe4fa0b6c21ab068b608c05df5db24ec9c274b09670e2f5ef2e02d8f5d872ae1e945ddfbb05df52b5a1fbcc6a3c51fae4f6bb3381ee3ffc', 'demo@demo.com', '2023-10-31 01:14:16'),
(92, '78a39b324f1002d12f91f76ef5c481034a7590c9d9245d4ec2486d2b2fcae5d3cce99d85633ef846a5127f3c176860131fb4d89a13a619acecc6a23cbfadaa31', 'demo@demo.com', '2023-10-31 01:20:03'),
(93, '8fa6d0f2afea4d8f096e551ddeeb69b184c7ad3aad67bc3d3c4e8443156aed2c03ebadad0bd8ee4b482161eb22b4fc28a6835c14c0993a150f6512df3a76a931', 'demo@demo.com', '2023-10-31 01:24:33'),
(94, '260ca74d52538f5a4f50401b18eae91ce2be7b1289e3a6af6f4a3ac7bf650225e41ce00d65cce7b0c64dee4a80ecc18e0dba30a2d794431aaac35ff16a44a3c3', 'demo@demo.com', '2023-10-31 01:28:53'),
(95, '8120568f58a4a9ae3067dca62212d4c2c6e471b448f57a0f2e8f1b3c5424f7c712b4f3c3c8679293616729892bde6ecc428626a39d7c57da41836850ea8cd514', 'demo@demo.com', '2023-10-31 01:32:25'),
(96, '7a4611299830142cf89737bd4396dc058cd5212a539c2ee003a8a3e3fb98270aaad89378a63876b765c1505326b813aef52697305b239d5a722306c146b3a1f4', 'demo@demo.com', '2023-10-31 09:26:17'),
(97, '031c69e42e191fe02a14e0aa8e17e5e2787b312936150f44b121b59c87558f99b56da60b9b236892b94dda721bb6c4e01cebdce1c28f3af80d01ec978b22e6eb', 'demo@demo.com', '2023-10-31 09:28:42'),
(98, '19c09eb0520336b53614e7d75ec8850037876a326c049f8b2b7f859b112fd9f9e95f3fec6bd7df33c889221578affeb910bb82b0167abae977f715e3dc9a6b58', 'demo@demo.com', '2023-10-31 09:29:50'),
(99, 'bb360105edf760d36ba8d62ab90d35c481abd41fc99e57040106d362fe9e6b788de5c388d7212792a758e7f86569a9ffd6c73305d22d94a2617e8dd9eefe98b7', 'demo@demo.com', '2023-10-31 09:30:57'),
(100, 'da7ba08f4e0e2e95ae5bc5f6c5f79ad45626d716344ab56324798cd0a97eec2fe02f2bf3d96f097dc55a12c5ea3ad3249f8b522a545dd5993cf3a9e5dedd8d51', 'demo@demo.com', '2023-10-31 09:30:59'),
(101, 'eefff1f0bcc5eb61b94635faeff0b4c44553206bde76564956964dcce435b23cf4811233119c563e270f0a52dcd0509844b701f1d841f977578017caa6a2c741', 'demo@demo.com', '2023-10-31 09:39:07'),
(102, 'a4977431c4c24434c08099a7b6946ae27cc0c359ae35b914eb95c1e0d6a68a9f99660c818b59c48e59b4b6ce87429e6194b033344fdb6798a0b0454a989f48c0', 'demo@demo.com', '2023-10-31 09:39:09'),
(103, '1b66b1086b2c8754bbdd6a0ab0f79fca28918daf35848642c3778652e1082fd39b1544fd8e8dd584041b6fbd87d08a95a341b638e4fd0da17616ad1183e9dff1', 'demo@demo.com', '2023-10-31 09:41:13'),
(104, '312817de1173fe7ac338c672850c299e976539179367953ab87c5abc0726525b69023e34e125a1d6f526a9a55ba77d8fdadae7910de3da8b1187fbff2e07c7a8', 'demo@demo.com', '2023-10-31 09:43:57'),
(105, '4d6afec8eb5b7a0ff6ce74eabded4c00dc2dc53482079b9a0309681d1f4d356141b49cecd37bc7312d786483996d49da1116fb068fc5437a5e1667efa898b4b0', 'demo@demo.com', '2023-10-31 09:46:54'),
(106, 'fccc2d9fafe5638ba49ca8d7b357611f1d60ee4aac3a9a16232dbb086daf8d12ecaab9f9ae757c1676fec6f16c5a5c3ed04d6db31fe682e6a52d2587948160f1', 'demo1@demo.com', '2023-10-31 11:56:19'),
(107, '106f0789009a8950a5afdc7394563be620c0f718e9764a9802f1e5919c6c2cf2a7018c754c066d51af3c8856fc2e42a579d4ab1ebea8889afc45eec1752b2fb3', 'demo1@demo.com', '2023-10-31 11:56:22'),
(108, '0beb9d0af8c7095a3ab3955215e4e308a67adf965415d54c6df54fdd89b848bfeb07c9d652acaf44dbe606ad20e92f9f0d8647b1ea5656c444a76db73461cfe8', 'demo@demo.com', '2023-10-31 12:06:35'),
(109, '55943e4f0aae836b216c761f02999d3ac6574e9df47dc532f568478405726d841fd8ca53b64ba6d8e2f9d6a8857d011fe0c2cee4405663ec9a5be440a9c4acb2', 'demo2@demo.com', '2023-10-31 12:09:41'),
(110, 'f8d3a4f89dece8ad619dd53966e32b69e41ef0a51ad17206df0bb7eab45ecc7cf96db8bbf474c1d364ebcee41e0d05f2f08d1002cab6d6b7fed1c3b1fdc20dd3', 'demo2@demo.com', '2023-10-31 12:13:29'),
(111, '7aeb79bbe8f216639a908d6b012c0e2806568eabf83f2d518050240e7faf99eb736df4eea940839ce8796dc7edf67fbfc416d55ccf9e980cf9a7a81138bfb91a', 'demo@demo.com', '2023-10-31 15:02:16'),
(112, '30ab5857a5cbf35e93541f1edea552d8d181f974868dfb91df3a01b7629d848d2a42228aec20c99d3798ddd0b75e5a50c46df6e075500d617003a3cea23a3dce', 'demo2@demo.com', '2023-10-31 15:13:54'),
(113, '201a1ef3daec459102a93f80f33baa80df2434233ed7acf8d3e56423f6e787b2bf1e905c37e519588d51aed2d2bf184f0f9ab5ebe8fc45c537a6c988fc4583f1', 'demo1@demo.com', '2023-10-31 15:29:59'),
(114, '66b9a15cc820eb4e3ef9fe54263684290c8365aa88f6d765ed95deb2aafd56fa324ea1da0a543c49e93907a8f7fea27a48e048e1efa76e39971c97b0a6ae5365', 'demo4@demo.com', '2023-10-31 15:32:28'),
(115, '803f3b4f1688bc5330d91815bd9c5690b5c5f9794ef3963c252335f1ea92583659483bf5a3c5e5c6529a714594dab3e9c11cdc80dc611772006a5690cdb71098', 'demo@demo.com', '2023-10-31 15:51:51');

-- --------------------------------------------------------

--
-- Structure de la table `tache`
--

CREATE TABLE `tache` (
  `id` int NOT NULL,
  `liste_id` int NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tache`
--

INSERT INTO `tache` (`id`, `liste_id`, `titre`, `status`) VALUES
(6, 6, 'ok', 0),
(7, 6, 'test', NULL),
(11, 13, 'okopgjkophf', 0),
(12, 12, 'Champagnes', 1),
(13, 12, 'Oeufs : 12€', 0),
(14, 12, 'Vache : 2500€', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(4, 'demo4@demo.com', '[\"ROLE_ADMIN\"]', '$2y$13$up7wasmjeK018jefp.I8iOaq5ZA58wzF3iRTxIvd8grWCukxrjRZi'),
(6, 'rdemo@demo.com', '[\"ROLE_USER\"]', '$2y$13$6JBWLVJ/CDFiS/EW7rQky.1iLfSLcB9a4qvOqhZnPH6ckg8CCOxJW'),
(7, 'demo@demo.com', '[\"ROLE_USER\"]', '$2y$13$qIWJ.IKF1gblo4YHOAxLgeCoy123XRy2sDphfypBT8siFYL8xM3eu');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `liste`
--
ALTER TABLE `liste`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FCF22AF4A76ED395` (`user_id`);

--
-- Index pour la table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9BACE7E1C74F2195` (`refresh_token`);

--
-- Index pour la table `tache`
--
ALTER TABLE `tache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_93872075E85441D8` (`liste_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `liste`
--
ALTER TABLE `liste`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT pour la table `tache`
--
ALTER TABLE `tache`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `liste`
--
ALTER TABLE `liste`
  ADD CONSTRAINT `FK_FCF22AF4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `tache`
--
ALTER TABLE `tache`
  ADD CONSTRAINT `FK_93872075E85441D8` FOREIGN KEY (`liste_id`) REFERENCES `liste` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
