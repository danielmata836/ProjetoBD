CREATE TABLE dbo.AspNetRoles ( 
	Id                   nvarchar(450) NOT NULL    ,
	ConcurrencyStamp     nvarchar(max)     ,
	Name                 nvarchar(256)     ,
	NormalizedName       nvarchar(256)     ,
	CONSTRAINT PK_AspNetRoles PRIMARY KEY  ( Id )
 );

CREATE  INDEX RoleNameIndex ON dbo.AspNetRoles ( NormalizedName );

CREATE TABLE dbo.AspNetUserTokens ( 
	UserId               nvarchar(450) NOT NULL    ,
	LoginProvider        nvarchar(450) NOT NULL    ,
	Name                 nvarchar(450) NOT NULL    ,
	Value                nvarchar(max)     ,
	CONSTRAINT PK_AspNetUserTokens PRIMARY KEY  ( UserId, LoginProvider, Name )
 );

CREATE TABLE dbo.AspNetUsers ( 
	Id                   nvarchar(450) NOT NULL    ,
	AccessFailedCount    int NOT NULL    ,
	ConcurrencyStamp     nvarchar(max)     ,
	Email                nvarchar(256)     ,
	EmailConfirmed       bit NOT NULL    ,
	LockoutEnd           datetimeoffset     ,
	NormalizedEmail      nvarchar(256)     ,
	LockoutEnabled       bit NOT NULL    ,
	NormalizedUserName   nvarchar(256)     ,
	PasswordHash         nvarchar(max)     ,
	PhoneNumber          nvarchar(max)     ,
	PhoneNumberConfirmed bit NOT NULL    ,
	SecurityStamp        nvarchar(max)     ,
	TwoFactorEnabled     bit NOT NULL    ,
	UserName             nvarchar(256)     ,
	CONSTRAINT PK_AspNetUsers PRIMARY KEY  ( Id ),
	CONSTRAINT UserNameIndex UNIQUE ( NormalizedUserName ) 
 );

CREATE  INDEX EmailIndex ON dbo.AspNetUsers ( NormalizedEmail );

CREATE TABLE dbo.GT ( 
	id_GT                int NOT NULL    ,
	sigla                varchar(100) NOT NULL    ,
	nome_GT              varchar(100) NOT NULL    ,
	CONSTRAINT PK__GT__0148FAB02AA74C4D PRIMARY KEY  ( id_GT )
 );

CREATE TABLE dbo.Instituicao ( 
	Num_Inst             int NOT NULL    ,
	Tipo_Inst            varchar(100) NOT NULL    ,
	Nome_Inst            varchar(100) NOT NULL    ,
	Morada_Inst          varchar(100) NOT NULL    ,
	Parceiro             varchar(10) NOT NULL    ,
	acronimo             varchar(100) NOT NULL    ,
	Formacao             varchar(10) NOT NULL    ,
	CONSTRAINT PK__Institui__1AB371AF3C63ACA7 PRIMARY KEY  ( Num_Inst )
 );

CREATE TABLE dbo.Recursos ( 
	index_Recurso        int NOT NULL    ,
	obs                  varchar(100)     ,
	Designacao_EN        varchar(100)     ,
	Designacao_PT        varchar(100)     ,
	res                  varchar(100)     ,
	web                  varchar(100)     ,
	custo                float     ,
	Dado                 varchar(100)     ,
	CONSTRAINT PK__Recursos__15E4AC487C7F383F PRIMARY KEY  ( index_Recurso )
 );

CREATE TABLE dbo.Servicos ( 
	index_servicos       int NOT NULL    ,
	designa_pt_servicos  varchar(100) NOT NULL    ,
	designa_en_servicos  varchar(100) NOT NULL    ,
	inst_dispo_servicos  varchar(100) NOT NULL    ,
	obs_servicos         varchar(100) NOT NULL    ,
	custo_servicos       float NOT NULL    ,
	desc_servicos        varchar(100) NOT NULL    ,
	id_GT                int NOT NULL    ,
	data_inicio          date     ,
	data_fim             date     ,
	CONSTRAINT PK__Servicos__F24D933857020C04 PRIMARY KEY  ( index_servicos )
 );

CREATE TABLE dbo.UI ( 
	id_UI                int NOT NULL    ,
	nome_UI              varchar(100) NOT NULL    ,
	acronimo_UI          varchar(100) NOT NULL    ,
	morada_UI            varchar(100) NOT NULL    ,
	CONSTRAINT PK__UI__014944D33ED4D421 PRIMARY KEY  ( id_UI )
 );

CREATE TABLE dbo.__EFMigrationsHistory ( 
	MigrationId          nvarchar(150) NOT NULL    ,
	ProductVersion       nvarchar(32) NOT NULL    ,
	CONSTRAINT PK___EFMigrationsHistory PRIMARY KEY  ( MigrationId )
 );

CREATE TABLE dbo.esta_atribuido ( 
	index_Recurso        int NOT NULL    ,
	index_servicos       int NOT NULL    ,
	CONSTRAINT PK__esta_atr__8AC0757B4C69DC84 PRIMARY KEY  ( index_Recurso, index_servicos )
 );

CREATE TABLE dbo.AspNetRoleClaims ( 
	Id                   int NOT NULL   IDENTITY ,
	ClaimType            nvarchar(max)     ,
	ClaimValue           nvarchar(max)     ,
	RoleId               nvarchar(450) NOT NULL    ,
	CONSTRAINT PK_AspNetRoleClaims PRIMARY KEY  ( Id )
 );

CREATE  INDEX IX_AspNetRoleClaims_RoleId ON dbo.AspNetRoleClaims ( RoleId );

CREATE TABLE dbo.AspNetUserClaims ( 
	Id                   int NOT NULL   IDENTITY ,
	ClaimType            nvarchar(max)     ,
	ClaimValue           nvarchar(max)     ,
	UserId               nvarchar(450) NOT NULL    ,
	CONSTRAINT PK_AspNetUserClaims PRIMARY KEY  ( Id )
 );

CREATE  INDEX IX_AspNetUserClaims_UserId ON dbo.AspNetUserClaims ( UserId );

CREATE TABLE dbo.AspNetUserLogins ( 
	LoginProvider        nvarchar(450) NOT NULL    ,
	ProviderKey          nvarchar(450) NOT NULL    ,
	ProviderDisplayName  nvarchar(max)     ,
	UserId               nvarchar(450) NOT NULL    ,
	CONSTRAINT PK_AspNetUserLogins PRIMARY KEY  ( LoginProvider, ProviderKey )
 );

CREATE  INDEX IX_AspNetUserLogins_UserId ON dbo.AspNetUserLogins ( UserId );

CREATE TABLE dbo.AspNetUserRoles ( 
	UserId               nvarchar(450) NOT NULL    ,
	RoleId               nvarchar(450) NOT NULL    ,
	CONSTRAINT PK_AspNetUserRoles PRIMARY KEY  ( UserId, RoleId )
 );

CREATE  INDEX IX_AspNetUserRoles_RoleId ON dbo.AspNetUserRoles ( RoleId );

CREATE  INDEX IX_AspNetUserRoles_UserId ON dbo.AspNetUserRoles ( UserId );

CREATE TABLE dbo.Equipamento ( 
	no_regis_produto     int NOT NULL    ,
	nome_equi            varchar(100) NOT NULL    ,
	index_Recurso        int NOT NULL    ,
	garantia             date     ,
	categoria            varchar(100)     ,
	Equi_obs             varchar(100)     ,
	CONSTRAINT PK__Equipame__765BC3EEC11471AB PRIMARY KEY  ( no_regis_produto )
 );

CREATE TABLE dbo.Formacao ( 
	tipo_formacao        varchar(100) NOT NULL    ,
	descricao_Formacao   varchar(200) NOT NULL    ,
	index_Recurso        int NOT NULL    ,
	tipo_Ensino          varchar(100)     
 );

CREATE TABLE dbo.Pessoa ( 
	id_Pessoa            int NOT NULL    ,
	email_pessoa         varchar(100)     ,
	nome_pessoa          varchar(100)     ,
	responsavel          varchar(10)     ,
	membro               varchar(1)     ,
	index_servicos       int     ,
	Num_Inst             int     ,
	id_GT                int     ,
	id                   nvarchar(450)     ,
	CONSTRAINT PK__Pessoa__402CBA7508FA0FE3 PRIMARY KEY  ( id_Pessoa )
 );

CREATE TABLE dbo.Produtos ( 
	niv_produtos         int     ,
	tipo_produtos        varchar(100)     ,
	descricaoProduto     varchar(100) NOT NULL    ,
	index_Recurso        int NOT NULL    
 );

CREATE TABLE dbo.pede ( 
	id_Pessoa            int NOT NULL    ,
	index_servicos       int NOT NULL    ,
	CONSTRAINT PK__pede__DF0863467E8B38ED PRIMARY KEY  ( id_Pessoa, index_servicos )
 );

CREATE TABLE dbo.pertenceUI ( 
	id_UI                int NOT NULL    ,
	id_Pessoa            int NOT NULL    ,
	CONSTRAINT PK__pertence__454B8F7451765B34 PRIMARY KEY  ( id_UI, id_Pessoa )
 );

CREATE TABLE dbo.pertencer ( 
	Num_Inst             int NOT NULL    ,
	no_regis_produto     int NOT NULL    ,
	CONSTRAINT PK__pertence__EDD6CD9175D56D2D PRIMARY KEY  ( Num_Inst, no_regis_produto )
 );

ALTER TABLE dbo.AspNetRoleClaims ADD CONSTRAINT FK_AspNetRoleClaims_AspNetRoles_RoleId FOREIGN KEY ( RoleId ) REFERENCES dbo.AspNetRoles( Id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE dbo.AspNetUserClaims ADD CONSTRAINT FK_AspNetUserClaims_AspNetUsers_UserId FOREIGN KEY ( UserId ) REFERENCES dbo.AspNetUsers( Id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE dbo.AspNetUserLogins ADD CONSTRAINT FK_AspNetUserLogins_AspNetUsers_UserId FOREIGN KEY ( UserId ) REFERENCES dbo.AspNetUsers( Id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE dbo.AspNetUserRoles ADD CONSTRAINT FK_AspNetUserRoles_AspNetRoles_RoleId FOREIGN KEY ( RoleId ) REFERENCES dbo.AspNetRoles( Id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE dbo.AspNetUserRoles ADD CONSTRAINT FK_AspNetUserRoles_AspNetUsers_UserId FOREIGN KEY ( UserId ) REFERENCES dbo.AspNetUsers( Id ) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE dbo.Equipamento ADD CONSTRAINT FK__Equipamen__index__3F466844 FOREIGN KEY ( index_Recurso ) REFERENCES dbo.Recursos( index_Recurso ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.Formacao ADD CONSTRAINT FK__Formacao__index___3C69FB99 FOREIGN KEY ( index_Recurso ) REFERENCES dbo.Recursos( index_Recurso ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.Pessoa ADD CONSTRAINT FK__Pessoa__id_GT__52593CB8 FOREIGN KEY ( id_GT ) REFERENCES dbo.GT( id_GT ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.Pessoa ADD CONSTRAINT Fk_Pessoa_Instituicao FOREIGN KEY ( Num_Inst ) REFERENCES dbo.Instituicao( Num_Inst ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.Pessoa ADD CONSTRAINT FK__Pessoa__index_se__5070F446 FOREIGN KEY ( index_servicos ) REFERENCES dbo.Servicos( index_servicos ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.Pessoa ADD CONSTRAINT Fk_PessoaAspNet FOREIGN KEY ( id ) REFERENCES dbo.AspNetUsers( Id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.Produtos ADD CONSTRAINT FK__Produtos__index___3A81B327 FOREIGN KEY ( index_Recurso ) REFERENCES dbo.Recursos( index_Recurso ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.Servicos ADD CONSTRAINT FK__Servicos__id_GT__49C3F6B7 FOREIGN KEY ( id_GT ) REFERENCES dbo.GT( id_GT ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.esta_atribuido ADD CONSTRAINT FK__esta_atri__index__4CA06362 FOREIGN KEY ( index_Recurso ) REFERENCES dbo.Recursos( index_Recurso ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.esta_atribuido ADD CONSTRAINT FK__esta_atri__index__4D94879B FOREIGN KEY ( index_servicos ) REFERENCES dbo.Servicos( index_servicos ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.pede ADD CONSTRAINT FK__pede__id_Pessoa__5535A963 FOREIGN KEY ( id_Pessoa ) REFERENCES dbo.Pessoa( id_Pessoa ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.pede ADD CONSTRAINT FK__pede__index_serv__5629CD9C FOREIGN KEY ( index_servicos ) REFERENCES dbo.Servicos( index_servicos ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.pertenceUI ADD CONSTRAINT FK__pertenceU__id_Pe__59FA5E80 FOREIGN KEY ( id_Pessoa ) REFERENCES dbo.Pessoa( id_Pessoa ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.pertenceUI ADD CONSTRAINT FK__pertenceU__id_UI__59063A47 FOREIGN KEY ( id_UI ) REFERENCES dbo.UI( id_UI ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.pertencer ADD CONSTRAINT FK__pertencer__no_re__46E78A0C FOREIGN KEY ( no_regis_produto ) REFERENCES dbo.Equipamento( no_regis_produto ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE dbo.pertencer ADD CONSTRAINT Fk_pertencer_Instituicao FOREIGN KEY ( Num_Inst ) REFERENCES dbo.Instituicao( Num_Inst ) ON DELETE NO ACTION ON UPDATE NO ACTION;

INSERT INTO dbo.AspNetRoles( Id, ConcurrencyStamp, Name, NormalizedName ) VALUES ( '22037d5f-ff2c-4e7b-a429-cb8866570da5', 'bf5241ad-5609-4716-a1fc-a28e54d24461', 'Member', 'MEMBER' ); 
INSERT INTO dbo.AspNetRoles( Id, ConcurrencyStamp, Name, NormalizedName ) VALUES ( '8e4c3089-5be4-4b10-8779-e7c3eac9c608', 'fadb7e9d-75e6-4886-9369-c8f0fd5c3597', 'Admin', 'ADMIN' ); 
INSERT INTO dbo.AspNetRoles( Id, ConcurrencyStamp, Name, NormalizedName ) VALUES ( 'c2addd3e-e374-4277-ba0c-71e154953df7', '02054e33-2e63-439d-a07d-d13091e61471', 'Staff', 'STAFF' ); 
INSERT INTO dbo.AspNetUsers( Id, AccessFailedCount, ConcurrencyStamp, Email, EmailConfirmed, LockoutEnabled, LockoutEnd, NormalizedEmail, NormalizedUserName, PasswordHash, PhoneNumber, PhoneNumberConfirmed, SecurityStamp, TwoFactorEnabled, UserName ) VALUES ( '41ccf666-1c09-4a68-9970-c53aee7cbce5', 0, '6f152196-b3df-4e56-9c87-fa8b8a4c328a', 'daniel.mata@ubi.pt', 0, 1, null, 'DANIEL.MATA@UBI.PT', 'DANIEL.MATA@UBI.PT', 'AQAAAAEAACcQAAAAEBUurHVFh+RkShGbO/62ABZvW1sW1o4uZgV0R7rs6Qh/IVqZKfnMML+Ia1P4VYqXvQ==', null, 0, '465P45OR5QTN4BW7F26VFL6CAIUW2QHJ', 0, 'daniel.mata@ubi.pt' ); 
INSERT INTO dbo.AspNetUsers( Id, AccessFailedCount, ConcurrencyStamp, Email, EmailConfirmed, LockoutEnabled, LockoutEnd, NormalizedEmail, NormalizedUserName, PasswordHash, PhoneNumber, PhoneNumberConfirmed, SecurityStamp, TwoFactorEnabled, UserName ) VALUES ( '732fd563-6c9c-4bb2-90f9-a128b18f0b1f', 0, 'c134628d-4698-4338-aab7-5b7caa10d8e6', 'transportadoratabuense@sapo.pt', 0, 1, null, 'TRANSPORTADORATABUENSE@SAPO.PT', 'TRANSPORTADORATABUENSE@SAPO.PT', 'AQAAAAEAACcQAAAAEBTQoJCtuNw0hpTgR2+4Sr2Oc1uTPF+bOHF2DMFo4W/OPgRzSiZswzlzu53tpFBSKw==', null, 0, 'YWUADSK5ZI7GXVMKC5EUD3LQZ5QBRKJB', 0, 'transportadoratabuense@sapo.pt' ); 
INSERT INTO dbo.AspNetUsers( Id, AccessFailedCount, ConcurrencyStamp, Email, EmailConfirmed, LockoutEnabled, LockoutEnd, NormalizedEmail, NormalizedUserName, PasswordHash, PhoneNumber, PhoneNumberConfirmed, SecurityStamp, TwoFactorEnabled, UserName ) VALUES ( 'da29b6cb-a744-4d43-9d6d-320fc09f90c4', 0, 'bcd6b687-dc20-4177-a2b8-6918d24d7208', 'user@gmail.com', 0, 1, null, 'USER@GMAIL.COM', 'USER@GMAIL.COM', 'AQAAAAEAACcQAAAAEPJOV2V/w+LZw/+hVB8gxslky1PeD2HZlm6VAqYMR5NQcX9NbwmAgzQ5QdHO6fngvQ==', null, 0, 'VLEAEWDPQUFGTWLCPYC7DC7YTE7USOMK', 0, 'user@gmail.com' ); 
INSERT INTO dbo.AspNetUsers( Id, AccessFailedCount, ConcurrencyStamp, Email, EmailConfirmed, LockoutEnabled, LockoutEnd, NormalizedEmail, NormalizedUserName, PasswordHash, PhoneNumber, PhoneNumberConfirmed, SecurityStamp, TwoFactorEnabled, UserName ) VALUES ( 'de7f2d48-2ac3-46ab-808b-046191658d31', 0, '93a7f6c0-1944-458d-90cf-a34ee8484470', 'mota.santos@ubi.pt', 0, 1, null, 'MOTA.SANTOS@UBI.PT', 'MOTA.SANTOS@UBI.PT', 'AQAAAAEAACcQAAAAEBcC7PEz6+9BJfe512KWexw35Fl3oP7czDAqJq09QOCIdUpIPBwC034zNEGQZx8P3Q==', null, 0, 'NJX6JRIAKH3LFOVJQL6FTWO4GB4PDQKM', 0, 'mota.santos@ubi.pt' ); 
INSERT INTO dbo.AspNetUsers( Id, AccessFailedCount, ConcurrencyStamp, Email, EmailConfirmed, LockoutEnabled, LockoutEnd, NormalizedEmail, NormalizedUserName, PasswordHash, PhoneNumber, PhoneNumberConfirmed, SecurityStamp, TwoFactorEnabled, UserName ) VALUES ( 'eebf2d65-bee9-4e66-84c3-e03f35ee4213', 0, '928dcdfe-c081-4f26-8fc9-ba5d9c1c5e7f', 'danielmata836@sapo.pt', 0, 1, null, 'DANIELMATA836@SAPO.PT', 'DANIELMATA836@SAPO.PT', 'AQAAAAEAACcQAAAAECTo2VYdcwtzhEl3QCxFvYeEa8p6ptzNQHWQoetagyBwJ08TwI2kKdeSfqETtfFqJA==', null, 0, 'WYZJN35M6PSLIHOTAIYGHDNAHFC2KQD7', 0, 'danielmata836@sapo.pt' ); 
INSERT INTO dbo.GT( sigla, id_GT, nome_GT ) VALUES ( 'WG1', 1, 'Seismological data and networks' ); 
INSERT INTO dbo.GT( sigla, id_GT, nome_GT ) VALUES ( 'WG2', 2, 'Geophysics exploration' ); 
INSERT INTO dbo.GT( sigla, id_GT, nome_GT ) VALUES ( 'WG3', 3, 'Rock physics and geomechanics laboratories' ); 
INSERT INTO dbo.GT( sigla, id_GT, nome_GT ) VALUES ( 'WG4', 4, 'Geodetic and gravimetric networks and data' ); 
INSERT INTO dbo.GT( sigla, id_GT, nome_GT ) VALUES ( 'WG5', 5, 'Geochemical and mineralogical laboratories' ); 
INSERT INTO dbo.GT( sigla, id_GT, nome_GT ) VALUES ( 'WG6', 6, 'Magnetic data and observations' ); 
INSERT INTO dbo.GT( sigla, id_GT, nome_GT ) VALUES ( 'WG7', 7, 'Geological data and laboratories' ); 
INSERT INTO dbo.GT( sigla, id_GT, nome_GT ) VALUES ( 'WG8', 8, 'Geomathematic infrastructures' ); 
INSERT INTO dbo.GT( sigla, id_GT, nome_GT ) VALUES ( 'WG9', 9, 'Remote sensing' ); 
INSERT INTO dbo.GT( sigla, id_GT, nome_GT ) VALUES ( 'WG10', 10, 'Laboratory of paleomagnetism' ); 
INSERT INTO dbo.GT( sigla, id_GT, nome_GT ) VALUES ( 'WG11', 11, 'Marine seismic reflection and bathymetry laboratory' ); 
INSERT INTO dbo.GT( sigla, id_GT, nome_GT ) VALUES ( 'WG12', 12, 'Georesources' ); 
INSERT INTO dbo.GT( sigla, id_GT, nome_GT ) VALUES ( 'WG13', 13, 'Monitoring permafrost environments' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Associação RAEGE Açores', 1, ' Açores', 'S', ' A-RAEGE-Az', 'N' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'C4G - Collaboratory for Geosciences', 2, ' Covilhã', 'S', 'C4G', 'N' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Direção Geral do Território', 3, ' Lisboa', 'S', 'DGT', 'N' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Faculdade de Ciências da Universidade de Coimbra', 4, ' Coimbra', 'S', ' FCUC', 'N' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Faculdade de Ciências da Universidade de Lisboa', 5, ' Lisboa', 'S', 'FCUL', 'S' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Faculdade de Ciências da Universidade do Porto', 6, ' Porto', 'S', 'FCUP', 'S' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Faculdade de Engenharia do Porto', 7, ' Porto', 'S', 'FEUP', 'N' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Instituto Politécnico de Castelo Branco', 8, ' IPCB', 'S', ' Castelo Branco', 'N' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Instituto Politécnico de Portalegre', 9, ' Portalegre', 'S', 'IPP', 'N' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Instituto Português do Mar e da Atmosfera', 10, ' Lisboa', 'S', 'IPMA', 'S' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Instituto Superior Técnico-Universidade Lisboa', 11, ' Lisboa', 'S', 'IST-UL', 'S' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Instituto Superior de Engenharia de Lisboa', 12, ' Lisboa', 'S', 'ISEL', 'N' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Instituto Superior de Engenharia do Porto', 13, ' Porto', 'S', 'ISEP', 'N' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( 'S', 'Instituto de Engenharia de Sistemas e Computadores', 14, 'INESC TEC', ' Porto', ' Tecnologia e Ciência', ' Público' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Instituto de Geografia e Ordenamento do Território', 15, ' Lisboa', 'S', 'IGOT-UL', 'S' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Laboratório Nacional de Energia e Geologia', 16, ' Lisboa', 'S', 'LNEG', 'S' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Universidade da Beira Interior', 17, ' Covilhã', 'S', 'UBI', 'S' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Universidade de Aveiro', 18, ' Aveiro', 'S', 'UA', 'S' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Universidade de Coimbra', 19, ' Coimra', 'S', 'UC', 'N' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Universidade de Évora', 20, ' évora', 'S', 'UE', 'S' ); 
INSERT INTO dbo.Instituicao( Tipo_Inst, Nome_Inst, Num_Inst, Morada_Inst, Parceiro, acronimo, Formacao ) VALUES ( ' Público', 'Universidade do Algarve', 21, ' Algarve', 'S', 'UALG', 'N' ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 1, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 2, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 3, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 4, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 5, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 6, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 7, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 8, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 9, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 10, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 11, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 12, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 13, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 14, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 15, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 16, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 17, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 18, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 19, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 20, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 21, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 22, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 23, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 24, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 25, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 26, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 27, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 28, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 29, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 30, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 31, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 32, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Formation', 'Formação', null, null, null, 33, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 34, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 35, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 36, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 37, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 38, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 39, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 40, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 41, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 42, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 43, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 44, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 45, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 46, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 47, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 48, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 49, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 50, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 51, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 52, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 53, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 54, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 55, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 56, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 57, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 58, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 59, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 60, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 61, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 62, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 63, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 64, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 65, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 66, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 67, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 68, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 69, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 70, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 71, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 72, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 73, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 74, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 75, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 76, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 77, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 78, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 79, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 80, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 81, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 82, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 83, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 84, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 85, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 86, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 87, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 88, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 89, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 90, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 91, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 92, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 93, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 94, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 95, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 96, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 97, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 98, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 99, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 100, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 101, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 102, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 103, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 104, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 105, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 106, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 107, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 108, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 109, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 110, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 111, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 112, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 113, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 114, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 115, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 116, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 117, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 118, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 119, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 120, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 121, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 122, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 123, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 124, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 125, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 126, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 127, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 128, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 129, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 130, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 131, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 132, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 133, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 134, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 135, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 136, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 137, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 138, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 139, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 140, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Equipment', 'Equipamento', null, null, null, 141, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 142, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 143, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 144, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 145, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 146, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 147, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 148, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 149, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 150, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 151, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 152, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 153, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 154, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 155, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 156, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 157, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 158, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 159, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 160, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 161, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 162, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 163, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 164, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 165, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 166, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 167, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 168, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 169, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 170, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 171, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 172, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 173, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 174, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 175, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 176, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 177, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 178, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 179, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 180, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 181, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 182, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 183, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 184, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 185, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 186, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 187, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 188, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 189, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 190, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 191, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 192, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 193, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 194, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 195, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 196, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 197, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 198, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 199, null ); 
INSERT INTO dbo.Recursos( obs, Designacao_EN, Designacao_PT, res, web, custo, index_Recurso, Dado ) VALUES ( null, 'Data', 'Produtos', null, null, null, 200, null ); 
INSERT INTO dbo.UI( nome_UI, acronimo_UI, morada_UI, id_UI ) VALUES ( ' Centro de Ciências do Mar e do Ambiente', 'CCMA', ' Lisboa', 1 ); 
INSERT INTO dbo.UI( nome_UI, acronimo_UI, morada_UI, id_UI ) VALUES ( ' Centro de Estudos Geográficos', ' CEG', ' Lisboa', 2 ); 
INSERT INTO dbo.UI( nome_UI, acronimo_UI, morada_UI, id_UI ) VALUES ( ' Centro de Estudos Recursos Naturais', ' Ambiente e Sociedade', ' CERNAS', 3 ); 
INSERT INTO dbo.UI( nome_UI, acronimo_UI, morada_UI, id_UI ) VALUES ( ' Centro de Geociências da Universidade de Coimbra', ' CGeo', ' Coimbra', 4 ); 
INSERT INTO dbo.UI( nome_UI, acronimo_UI, morada_UI, id_UI ) VALUES ( ' Centro de Investigação da Terra e do Espaço da Universidade de Coimbra', ' CITEUC', ' Coimbra', 5 ); 
INSERT INTO dbo.UI( nome_UI, acronimo_UI, morada_UI, id_UI ) VALUES ( ' Centro de Pesquisa em Ciências Geoespaciais', ' CICGE', ' Porto', 6 ); 
INSERT INTO dbo.UI( nome_UI, acronimo_UI, morada_UI, id_UI ) VALUES ( ' Centro de Recursos Naturais e Ambiente', ' CERENA', ' Lisboa', 7 ); 
INSERT INTO dbo.UI( nome_UI, acronimo_UI, morada_UI, id_UI ) VALUES ( ' GeoBioCiências', ' GeoTecnologias e GeoEngenharia', ' GeoBioTec', 8 ); 
INSERT INTO dbo.UI( nome_UI, acronimo_UI, morada_UI, id_UI ) VALUES ( ' Instituto de Ciências da Terra', ' ICT', ' Lisboa', 9 ); 
INSERT INTO dbo.UI( nome_UI, acronimo_UI, morada_UI, id_UI ) VALUES ( ' Instituto de Dom Luiz', ' IDL', ' Lisboa', 10 ); 
INSERT INTO dbo.UI( nome_UI, acronimo_UI, morada_UI, id_UI ) VALUES ( ' Laboratório de Instrumentação e Física Experimental de Partículas', ' LIP', ' Lisboa ', 11 ); 
INSERT INTO dbo.__EFMigrationsHistory( MigrationId, ProductVersion ) VALUES ( '00000000000000_CreateIdentitySchema', '3.1.1' ); 
INSERT INTO dbo.AspNetUserRoles( UserId, RoleId ) VALUES ( '41ccf666-1c09-4a68-9970-c53aee7cbce5', '22037d5f-ff2c-4e7b-a429-cb8866570da5' ); 
INSERT INTO dbo.AspNetUserRoles( UserId, RoleId ) VALUES ( 'de7f2d48-2ac3-46ab-808b-046191658d31', 'c2addd3e-e374-4277-ba0c-71e154953df7' ); 
INSERT INTO dbo.AspNetUserRoles( UserId, RoleId ) VALUES ( 'eebf2d65-bee9-4e66-84c3-e03f35ee4213', '8e4c3089-5be4-4b10-8779-e7c3eac9c608' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 1, ' GNSS Topcon', 34, '2021-08-02', ' Geodesia', ' GNSS e afins' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 2, ' Antenas (VP geodésicas) e recetores', 35, null, ' Geodesia', ' GNSS e afins' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 3, ' Tripés para antenas', 36, null, ' Geodesia', ' GNSS e afins' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 4, ' GPS Stonex S900A e bastões', 37, null, ' Geodesia', ' GPS e equipamentos afins' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 5, ' GPS Leica GS09', 38, null, ' Geodesia', ' GPS e equipamentos afins' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 6, ' GPS Leica GS15', 39, null, ' Geodesia', ' GPS e equipamentos afins' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 7, ' GPS Trimble R4', 40, null, ' Geodesia', ' GPS e equipamentos afins' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 8, ' GPS Trimble Nomad', 41, null, ' Geodesia', ' GPS e equipamentos afins' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 9, ' GPS Trimble GeoExplorer 6000 Série GeoXR', 42, null, ' Geodesia', ' GPS e equipamentos afins' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 10, ' GPS estações totais', 43, null, ' Geodesia', ' GPS e equipamentos afins' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 11, ' Prensa hidraúlica', 44, null, ' Geologia', ' Pulverização e Preparação de Amostras' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 12, ' Isogranulador', 45, null, ' Geologia', ' Pulverização e Preparação de Amostras' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 13, ' moinho com maxilas removíveis de tungsténio carboneto', 46, null, ' Geologia', ' Pulverização e Preparação de Amostras' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 14, ' moinho de ágata Siebtechnik', 47, null, ' Geologia', ' Pulverização e Preparação de Amostras' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 15, ' Balanças digitais de alta precisão (Mettler)', 48, null, ' Geologia', ' Pulverização e Preparação de Amostras' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 16, ' máquinas de corte primário de rochas', 49, null, ' Geologia', ' Pulverização e Preparação de Amostras' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 17, ' GEOFORM – polidor de precisão e desgaste e discos e copos de diamante', 50, null, ' Geologia', ' Pulverização e Preparação de Amostras' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 18, ' sistema de polimento para lâminas e superfícies de rochas ', 51, null, ' Geologia', ' Pulverização e Preparação de Amostras' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 19, ' Husqvarna TS 230 F (máquina de corte primária)', 52, null, ' Geologia', ' Pulverização e Preparação de Amostras' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 20, ' máquina de corte de testemunhos de sondagens e rocha', 53, null, ' Geologia', ' Pulverização e Preparação de Amostras' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 21, ' Microssonda electrónica de alto vácuo com WDS e EDS', 54, null, ' Geoquímica', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 22, ' Espectrómetro de fluorescência de RX', 55, null, ' Geoquímica', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 23, ' Fluorescência de raios X de energia dispersiva', 56, null, ' Geoquímica', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 24, ' Difractómetro de raios X', 57, null, ' Geoquímica', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 25, ' Difractómetro de raios X portátil', 58, null, ' Geoquímica', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 26, ' Espectrómetro infravermelho portátil', 59, null, ' Geoquímica', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 27, ' Espectrómetro de Infra-vermelhos Bruker Tensor-27 equipado com detetor-TGC e unidade ATR', 60, null, ' Geoquímica', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 28, ' Espectrómetro de infravermelhos com transformada de Fourier', 61, null, ' Geoquímica', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 29, ' Espectrómetro de absorção atómica', 62, null, ' Geoquímica', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 30, ' Absorção Atómica Zenit', 63, null, ' Geoquímica', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 31, ' Fresadora', 64, null, ' Sismologia', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 32, ' Sismómetros de banda larga', 65, null, ' Sismologia', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 33, ' Módulos fotovoltaicos', 66, null, ' Sismologia', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 34, ' Controladores solares', 67, null, ' Sismologia', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 35, ' Bateria solar', 68, null, ' Sismologia', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 36, ' Acelerómetro estação permanente', 69, null, ' Sismologia', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 37, ' Rede móvel Reftek', 70, null, ' Sismologia', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 38, ' Rede OBS curto-periodo', 71, null, ' Sismologia', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 39, ' Sismómetro banda larga 6TD-1', 72, null, ' Sismologia', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 40, ' Espectrografia Gamma GR-256 com detector GPS-21', 73, null, ' Geofísica Aplicada', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 41, ' Ground Penetrating Radar GSSI SIR 3000', 74, null, ' Geofísica Aplicada', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 42, ' Radar de solos', 75, null, ' Geofísica Aplicada', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 43, ' Electromagnética frequênica muito baixa (VLF)', 76, null, ' Geofísica Aplicada', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 44, ' Resistivímetros', 77, null, ' Geofísica Aplicada', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 45, ' Condutivímetro de solo', 78, null, ' Geofísica Aplicada', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 46, ' Equipamento de diagrafias', 79, null, ' Geofísica Aplicada', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 47, ' Sísmica de reflexão (72 canais)', 80, null, ' Geofísica Aplicada', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 48, ' Fonte sísmica de massa acelerada', 81, null, ' Geofísica Aplicada', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 49, ' Geofones verticais 4 Hz 10 Hz 40 Hz', 82, null, ' Geofísica Aplicada', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 50, ' Analisar de partículas a laser', 83, null, ' Mecânica e Física das Rochas', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 51, ' Estação fotogramétrica Leica LPS', 84, null, ' Mecânica e Física das Rochas', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 52, ' Prensa de tração directa', 85, null, ' Mecânica e Física das Rochas', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 53, ' Prensa uniaxial', 86, null, ' Mecânica e Física das Rochas', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 54, ' Bomba de vácuo', 87, null, ' Mecânica e Física das Rochas', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 55, ' Microscópio ótico', 88, null, ' Mecânica e Física das Rochas', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 56, ' Célula triaxial Hoek', 89, null, ' Mecânica e Física das Rochas', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 57, ' Unidade Coreflooding', 90, null, ' Mecânica e Física das Rochas', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 58, ' Data-logger', 91, null, ' Mecânica e Física das Rochas', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 59, ' Emissor-Receptor ultrasónico', 92, null, ' Mecânica e Física das Rochas', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 60, ' Estação base magnética terrestre', 93, null, ' Geomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 61, ' Magnetómetro escalar de campo total', 94, null, ' Geomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 62, ' Magnetómetro Fluxo-DI', 95, null, ' Geomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 63, ' Magnetómetro escalar (campo total F)', 96, null, ' Geomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 64, ' Magnetómetro fluxgate triaxial', 97, null, ' Geomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 65, ' Magnetómetro Cesium G-858', 98, null, ' Geomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 66, ' Magnetómetro fluxgate LEMI-018', 99, null, ' Geomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 67, ' Magnetómetro de observações absolutas DI-flux (MinGeo)', 100, null, ' Geomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 68, ' Magnetómetro escalar de campo completo', 101, null, ' Geomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 69, ' Magnetómetro escalar (campo total F)', 102, null, ' Geomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 70, ' Magnetómetro Spinner (JR-6)', 103, null, ' Paleomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 71, ' Magnetizador de pulso anisterético (AMU-1A)', 104, null, ' Paleomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 72, ' Desmagnetizador de campo magnético alternado (LDA-3A)', 105, null, ' Paleomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 73, ' Magnetizador de Impulso (IM-10-30)', 106, null, ' Paleomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 74, ' Desmagnetizador térmico (caseiro)', 107, null, ' Paleomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 75, ' Desmagnetizador AF – magnetizador ARM', 108, null, ' Paleomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 76, ' Medidor de susceptibilidade magnética', 109, null, ' Paleomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 77, ' Magnetizador', 110, null, ' Paleomagnetismo', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 78, ' Estações de trabalho para processamento e interpretação de dados sísmicos', 111, null, ' Geologia Marinha', ' SeisLab' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 79, ' Radex Pro Seismic Processing software (Licenças)', 112, null, ' Geologia Marinha', ' SeisLab' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 80, ' Landmark suite software', 113, null, ' Geologia Marinha', ' SeisLab' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 81, ' Propagação sísmica de reflexão de alta resolução 1kJ pps 24 canais 200 tips sparker', 114, null, ' Geologia Marinha', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 82, ' Ecossounder multifeixe + SVP + sistema de posicionamento', 115, null, ' Geologia Marinha', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 83, ' Sistema aquático STR SeaSpyder de telemetria fotografia e vídeo', 116, null, ' Geologia Marinha', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 84, ' Sensor de velocidade do som Valeport & Analisador', 117, null, ' Geologia Marinha', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 85, ' Estações de trabalho', 118, null, ' Deteção Remota', ' GEOMODLAB' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 86, ' Software eCognition and PIX4D mapper', 119, null, ' Deteção Remota', ' GEOMODLAB' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 87, ' Lidar Phoenix Scout', 120, null, ' Deteção Remota', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 88, ' Hexacopterous', 121, null, ' Deteção Remota', ' Drones' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 89, ' Sensefly Ebee Classic', 122, null, ' Deteção Remota', ' Drones' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 90, ' Sensefly Ebee Plus RTK', 123, null, ' Deteção Remota', ' Drones' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 91, ' DJI Phantom 3 Advanced', 124, null, ' Deteção Remota', ' Drones' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 92, ' DJI Phantom 4', 125, null, ' Deteção Remota', ' Drones' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 93, ' Soda and Parrot Sequoia', 126, null, ' Deteção Remota', ' Câmaras para drones' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 94, ' Absorção Atómica Zenit', 127, null, ' Georecursos', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 95, ' Espectrofotómetro de feixe duplo Varian 100', 128, null, ' Georecursos', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 96, ' Fluorescência de raios X de energia dispersiva', 129, null, ' Georecursos', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 97, ' Reactor de lixiviação sob pressão', 130, null, ' Georecursos', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 98, ' Identificador de radionuclídeos com detector de germânio', 131, null, ' Georecursos', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 99, ' Analisador de granulometria por difração Laser', 132, null, ' Georecursos', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 100, ' Cromatógrafo fase gasosa para colunas com empacotamento FID e TCD', 133, null, ' Georecursos', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 101, ' Cromatógrafo em fase gasosa com colunas capilares para FID e ECD', 134, null, ' Georecursos', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 102, ' Célula de flutuação', 135, null, ' Georecursos', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 103, ' Câmara Corrosão Climática', 136, null, ' Georecursos', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 104, ' equipamento de perfuração para rocha', 137, null, ' Outros', ' Geradores' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 105, ' Trado para solos', 138, null, ' Outros', ' Geradores' ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 106, ' Servidores', 139, null, ' Outros', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 107, ' Sensores meteorológicos', 140, null, ' Outros', null ); 
INSERT INTO dbo.Equipamento( no_regis_produto, nome_equi, index_Recurso, garantia, categoria, Equi_obs ) VALUES ( 108, ' dataloggers diversos', 141, null, ' Outros', null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( 'Geologia', 'Caracterização petrográfica e microscópica de materiais geológicos', 1, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Sismologia', ' Estágios de curta-média duração (para profissionais) operação e gestão de rede sísmicas', 2, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Sismologia', ' Estágios de curta-média duração (para profissionais) processamento e análise sísmica', 3, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Sismologia', ' Estágios de curta duração (para alunos dos ensinos secundário e superior) redes sísmicas', 4, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geofísica Aplicada', ' Formação em aquisição processamento de dados de sísmica de reflexão e refração', 5, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geofísica Aplicada', ' Formação em Diagrafias', 6, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geofísica Aplicada', ' Formação em técnicas de inversão geofísica', 7, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geofísica Aplicada', ' Formação em inversão sísmica estocástica', 8, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geofísica Aplicada', ' Modelação numérica da deformação crustal para estudos da fonte sísmica', 9, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geofísica Aplicada', ' Inversão da forma de onda para estudo da fonte sísmica', 10, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geofísica Aplicada', ' Modelação da estrutura da crusta com dados de ruído sísmico e magnetometria', 11, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geofísica Aplicada', ' Registo processamento e interpretação de dados geofísicos em contexto arqueológico e no meio ambiente', 12, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geomatemática', ' modelação e computação Cursos teóricos e ou práticos nos 3 ciclos superiores nas áreas curriculares marinhas à medida dos parceiros C4G', 13, ' E-leraning e in-house' ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geomatemática', ' modelação e computação Formação avançada em interpretação de dados geofísicos', 14, ' E-learning e in-house' ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geoambiente', ' Curso “Modelação de processos geoquímicos”', 15, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geoambiente', 'Curso “Deteção remota aplicada ao Geoambiente”', 16, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geoambiente', 'Workshop “Impactes ambientais associados à indústria extrativa”', 17, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geoambiente', 'Workshop “Geologia médica”', 18, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geoambiente', 'Curso “Sistemas de Gestão Ambiental: ISO 14001 (2015)”', 19, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Geoambiente', 'Workshop “Hidrologia Isotópica na gestão sustentável de recursos hídricos”', 20, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Georrecursos', 'Formação em procedimentos de utilização de equipamentos específicos em georrecuros', 21, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Georrecursos', 'Formação em procedimentos normalizados de caracterização de georrecursos', 22, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( ' Georrecursos', 'Formação sobre operações unitárias em extração mineira processamento de minérios', 23, ' armazenamento de rejeitados etc' ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( 'Riscos Naturais', 'Workshops sobre o risco de movimentos de massa e sua cartografia', 24, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( 'Riscos Naturais', 'Formação para potenciais utilizadores do OpenQuake', 25, ' elearning' ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( 'Riscos Naturais', 'Formação técnico-científica elearning sobre riscos costeiros', 26, ' suscetibilidades e cartografia' ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( 'Riscos Naturais', 'Workshops sobre o risco de tsunami', 27, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( 'Riscos Naturais', 'Boas práticas e riscos de longo prazo decorrentes da exposição ao radão', 28, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( 'Riscos Cósmicos', ' Formação em Modelação de Espectros de Refletância de Meteoritos e Asteróides', 29, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( 'Materiais', 'Imagens relacionadas com as Ciências da Terra (GEOIMAGENS)', 30, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( 'Materiais', 'Léxico de geologia (GEOLEX)', 31, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( 'Materiais', 'Léxico de hidrogeologia (HIDROLEX)', 32, null ); 
INSERT INTO dbo.Formacao( tipo_formacao, descricao_Formacao, index_Recurso, tipo_Ensino ) VALUES ( 'Materiais', 'Glossário de Palinologia (PALINOGLOSS)', 33, null ); 
INSERT INTO dbo.Pessoa( email_pessoa, nome_pessoa, responsavel, membro, id_Pessoa, index_servicos, Num_Inst, id_GT, id ) VALUES ( ' danielmata836@sapo.pt', ' Daniel Mata', ' N', 'N', 2, null, null, null, 'eebf2d65-bee9-4e66-84c3-e03f35ee4213' ); 
INSERT INTO dbo.Pessoa( email_pessoa, nome_pessoa, responsavel, membro, id_Pessoa, index_servicos, Num_Inst, id_GT, id ) VALUES ( ' transportadoratabuense@sapo.pt', ' Transportadora Tabuense', ' N', 'N', 3, null, null, null, '732fd563-6c9c-4bb2-90f9-a128b18f0b1f' ); 
INSERT INTO dbo.Pessoa( email_pessoa, nome_pessoa, responsavel, membro, id_Pessoa, index_servicos, Num_Inst, id_GT, id ) VALUES ( ' mota.santos@ubi.pt', ' Miguel Santos', ' N', 'N', 4, null, null, null, 'de7f2d48-2ac3-46ab-808b-046191658d31' ); 
INSERT INTO dbo.Pessoa( email_pessoa, nome_pessoa, responsavel, membro, id_Pessoa, index_servicos, Num_Inst, id_GT, id ) VALUES ( ' daniel.mata@ubi.pt', ' Daniel Mata', ' N', 'S', 5, null, null, 1, '41ccf666-1c09-4a68-9970-c53aee7cbce5' ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geodesia', ' Dados de GNSS da ReNEP a Rede Portuguesa de Estações GNSS Permanentes', 142 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geodesia', ' Medidores de mare acústicas – dados de nível do mar', 143 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geodesia', ' Modelo geóide para converter altura elipsoidal em altura ortométrica', 144 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geodesia', ' Campanhas de campo geodésicas', 145 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geodesia', '  Portal de dados em geodesia – visualização', 146 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geologia', 'Testemunhos de sondagens', 147 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geologia', 'Base de dados Recursos hidrogeológicos portugueses e ocorrências termais', 148 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geologia', 'Base de dados Inclusões fluidas', 149 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geologia', 'Base de dados Documentação técnica não publicada', 150 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geologia', 'Mapas Geológicos', 151 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, ' Geologia', 'Catálogos e Coleções', 152 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, ' Geologia', 'Inventários', 153 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Sismologia', ' Dados sismológicos e redes', 154 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, ' Geofísica Aplicada', ' Ruido sísmico', 155 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, ' Geofísica Aplicada', 'Perfis de Tomografia elétrica no Vale do Tejo', 156 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geofísica Aplicada', ' Perfis de Georadar (Vale do Tejo)', 157 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geofísica Aplicada', 'Relatórios técnicos de sondagens geotécnicas', 158 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Mecânica das Rochas ', 'Dados de módulos elásticos', 159 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geomagnetismo ', '  Séries de valores médios (minuto hora ano) do observatório magnético de Coimbra', 160 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Paleomagnetismo', 'Instalações de campo em paleomagnetismo', 161 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geomatemática', ' Modelação e Computação', 162 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geomatemática', ' Modelação e Computação', 163 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geomatemática', ' Modelação e Computação', 164 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geomatemática', ' Software', 165 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Riscos Naturais', 'Alerta precoce de tsunamis', 166 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Riscos Naturais', 'Estudos de risco sísmico e mapas de stress', 167 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Riscos Naturais', 'Avaliação de riscos em ambiente costeiro', 168 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Riscos Naturais', 'Avaliação da suscetibilidade à instabilidade de taludes', 169 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Riscos Naturais', 'Mapas de suscetibilidade de instabilidade de arribas à escala regional', 170 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Riscos Naturais', 'Monitorização da emissão de radão em solos e rochas para controle ambiental', 171 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Riscos Antropogénicos', ' em construção', 172 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Riscos Cósmicos', 'Dados solares e monitorização de dados climáticos espaciais', 173 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, ' Riscos Cósmicos', ' Espectroscopia de refletância asteróide', 174 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geologia Marinha', ' Dados de reflexão sísmica', 175 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geologia Marinha', 'Observação direta do fundo do mar foto e vídeo', 176 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geologia Marinha', ' Multibeam e backscatter: aquisição processamento e interpretação ', 177 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geologia Marinha', ' Disponibilização de cartografia temática no EMODnet-geology', 178 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geologia Marinha', ' Observação direta do fundo do mar aquisição de video', 179 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geologia Marinha', ' Perfis de velocidade do som da coluna de água', 180 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Deteção Remota', 'Mapas de ocupação do solo a partir de imagens de deteção remota', 181 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Deteção Remota', 'mapRS Mapeamento para gestão de georrecursos', 182 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Deteção Remota', 'droneMAP Aquisição de dados usando drones e processamento para caracterização temática', 183 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Deteção Remota', 'Mapeamento da deformação da superfície com recurso a interferometria SAR', 184 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Deteção Remota', 'droneMAP Aquisição de dados usando drones e processamento para caracterização temática', 185 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geoambiente', 'Mapas geoquímicos', 186 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geoambiente ', 'Mapas de vulnerabilidade geoambiental', 187 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geoambiente ', 'Mapas de ocupação do solo a partir de imagens de deteção remota', 188 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geoambiente ', 'Planos e redes de monitorização de parâmetros geoambientais', 189 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geoambiente ', ' Carta geoambiental morfológica e geomorfológica', 190 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geoambiente ', 'Identificação de anomalias geoambientais em diferentes meios ', 191 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geoambiente ', 'Identificação e avaliação de vulnerabilidade ambiental em diferentes meios', 192 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geoambiente ', 'Caracterização e análise multi-escalar de processos geoambientais', 193 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geoambiente ', 'Identificação de medidas de remediação e mitigação', 194 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geoambiente ', 'Monitorização de parâmetros geoambientais', 195 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geoambiente ', 'Modelação de processos geoquímicos de interação água-rocha', 196 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Geoambiente ', 'Estudos de impacte ambiental', 197 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Monitorização de ambientes com permafrost', 'Temperaturas do permafrost da Península Antártica', 198 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Monitorização de ambientes com permafrost', 'Cartografia geoambiental de perigosidade e de risco em regiões polares e de montanha', 199 ); 
INSERT INTO dbo.Produtos( niv_produtos, tipo_produtos, descricaoProduto, index_Recurso ) VALUES ( null, 'Monitorização de ambientes com permafrost', 'Consultadoria ambiental em regiões polares e de montanha', 200 ); 
INSERT INTO dbo.pertenceUI( id_UI, id_Pessoa ) VALUES ( 1, 5 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 5, 11 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 5, 70 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 6, 1 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 7, 48 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 7, 100 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 10, 36 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 10, 67 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 10, 80 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 10, 81 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 11, 49 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 11, 55 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 11, 101 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 12, 57 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 15, 20 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 15, 105 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 16, 23 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 16, 87 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 16, 108 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 17, 4 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 17, 88 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 18, 26 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 19, 68 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 19, 77 ); 
INSERT INTO dbo.pertencer( Num_Inst, no_regis_produto ) VALUES ( 20, 37 ); 