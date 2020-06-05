﻿using System;
using System.Text;
using System.Threading.Tasks;
using Microsoft.IdentityModel.Tokens;

namespace ProjetoNew.Authentication
{
    public class TokenProviderOptions
    {
        public static string Audience { get; } = "ProjetoNewAudience";
        public static string Issuer { get; } = "ProjetoNew";
        public static SymmetricSecurityKey Key { get; } = new SymmetricSecurityKey(Encoding.ASCII.GetBytes("ProjetoNewSecretSecurityKeyProjetoNew"));
        public static TimeSpan Expiration { get; } = TimeSpan.FromMinutes(5);
        public static SigningCredentials SigningCredentials { get; } = new SigningCredentials(Key, SecurityAlgorithms.HmacSha256);
    }
}
