NPM:
http://IP:81

现在输入默认的用户名和密码登录。

默认用户：admin@example.com
默认密码：changeme

HOMRSERVER
1.服务器名称
在该字段的顶部附近，homeserver.yaml您需要确保该server_name值设置为您的服务器 FQDN（完整 URL）。例如，我说“matrix.osis.me”。

2.允许注册
打开homeserver.yaml文件并找到## Registration ## 部分。在该部分的底部，删除行前的 hastag/磅符号enable_registration: true。
设置此项允许用户注册您的 Matrix 服务器实例。您可以通过将主题标签/井号放回原位或将值设置为 false 来禁用此设置。这将关闭用户注册，并使服务器成为仅限邀请的服务器。仅使用 Invite 时，您需要/想要设置其他设置，以确定哪些用户可以邀请某人加入您的实例。

3.SMTP 设置
再一次，如果您的电子邮件 smtp 服务器/提供商使用 StartTLS，并且是 TLS 版本 1.1 或更高版本，您将无法（在撰写本文时）使用注册的电子邮件部分。应该有一个解决方案来解决这个问题，但在我的研究中，它似乎已经出现了将近一年.但是，如果您的电子邮件服务器不使用加密或 SSL / TLS 1.0，那么您可以设置 SMTP 以发送电子邮件以进行注册、消息通知等。搜索“SMTP”并找到标题为“从 Synapse 发送电子邮件的配置”的部分。（提示：我必须使用 CTRL+W 2 次才能到那里搜索 SMTP）。
在本节中，您需要取消注释以下行：
smtp_port: 587- 并将端口更改为您的 SMTP 服务器或提供商的正确端口。
smtp_user: "your-user@some-email-domain.com"
smtp_pass: "your-email-users-password"
require_transport_security: true- 这个你应该只在你的服务器使用 StartTLS 时使用，并且你应该清楚地理解这一行上面的注释。

