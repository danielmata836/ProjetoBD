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
	tipo_Ensino          varchar(100)     ,
	index_formacao       int NOT NULL    ,
	CONSTRAINT Pk_Formacao_index_formacao PRIMARY KEY  ( index_formacao )
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
	index_Recurso        int NOT NULL    ,
	index_produtos       int NOT NULL    ,
	CONSTRAINT Pk_Produtos_index_produtos PRIMARY KEY  ( index_produtos )
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