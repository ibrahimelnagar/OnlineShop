namespace OnlineShop.Core.Interfaces
{
    public interface ICryptographyService
    {
        string Encrypt(string plainText, string passPhrase);
        string Decrypt(string cipherText, string passPhrase);
    }
}
