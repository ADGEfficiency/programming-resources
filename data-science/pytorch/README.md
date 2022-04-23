

## zero_grad()

pytorch will accumulate gradients - default action to sum gradients on every `loss.backward`


## loss_fn, loss.backward

loss_fn = nn.CrossEntropyLoss()
loss = loss_fn(pred, y)


## optimizer.step()

optimizer.step performs a parameter update based on the current gradient (stored in .grad attribute of a parameter)

optimizer = torch.optim.SGD(model.parameters(), lr=1e-3)
optimizer.step()
