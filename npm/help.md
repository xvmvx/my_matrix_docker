主机:
1.输入站点的 URL。如“matrix.osis.me”。
2.输入 docker0 接口的 IP。终端：ip addr show docker0  记下 IPv4 地址（通常为 172.18.0.1，但并非总是如此，因此请仔细检查）。
3.在 IP 字段中输入该 IP 地址。接下来在端口字段中输入 8008（或您映射到容器端口 80 的端口）。
4.启用 Cache Assets、Block Common Explits 和 Websockets Support 的设置。然后保存。

SSL 加密

单击条目右端的 3 个垂直点图标，然后选择“编辑”。现在移动到“自定义位置”选项卡，然后单击“添加位置”按钮

在表单中，在“定义位置”字段中输入相同的 URL，然后https从“方案”字段中进行选择。现在在 IP 地址字段中输入相同的 IP（可能是 172.17.0.1），在端口字段中输入端口 4143（或您为主机选择的任何端口）
到“SSL”选项卡，然后从“SSL 证书”下拉列表中选择“请求新证书”。

启用“强制 SSL”，确保为 LetsEncrypt 的 TOS 输入您的电子邮件，然后启用“我同意”切换。单击“保存”并等待几秒钟。如果弹出窗口关闭且没有错误，则应进行设置。

现在再次单击网格行中的 URL，它应该会打开一个显示 Matrix 服务器页面的新选项卡，但是现在您应该在地址栏中看到 SSL 锁定图标。如果出现错误，请检查您的设置，然后重试。
