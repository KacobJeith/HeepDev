class ENC28J60Connection
{
public:
	ENC28J60Connection();
	~ENC28J60Connection();

	void Connect();

private:
	int TCP_PORT;
};