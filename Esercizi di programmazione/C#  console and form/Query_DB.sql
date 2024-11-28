CREATE TABLE [dbo].[hobby] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [descrizione] VARCHAR (15) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[Città] (
    [id_city]     INT          IDENTITY (1, 1) NOT NULL,
    [descrizione] VARCHAR (30) NULL,
    CONSTRAINT [pk_city] PRIMARY KEY CLUSTERED ([id_city] ASC)
);

CREATE TABLE [dbo].[Persona] (
    [ID_P]      INT          IDENTITY (1, 1) NOT NULL,
    [nome]      VARCHAR (10) NULL,
    [cognome]   VARCHAR (15) NULL,
    [città_res] INT          NULL,
    PRIMARY KEY CLUSTERED ([ID_P] ASC),
    CONSTRAINT [FKper_1] FOREIGN KEY ([città_res]) REFERENCES [dbo].[Città] ([id_city])
);

CREATE TABLE [dbo].[Pers_Hobby] (
    [ID]       INT IDENTITY (1, 1) NOT NULL,
    [Id_per]   INT NULL,
    [Id_Hobby] INT NULL,
    CONSTRAINT [FK_PH1] FOREIGN KEY ([Id_per]) REFERENCES [dbo].[Persona] ([ID_P]),
    CONSTRAINT [FK_PH2] FOREIGN KEY ([Id_Hobby]) REFERENCES [dbo].[hobby] ([id])
);
