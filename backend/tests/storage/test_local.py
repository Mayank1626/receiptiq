import pytest
from app.storage.local import LocalStorageProvider

@pytest.fixture
def temp_provider(tmp_path):
    return LocalStorageProvider(base_path=tmp_path)

@pytest.mark.asyncio
async def test_save_and_exists(temp_provider):
    content = b"test content"
    path = "test/file.txt"
    
    saved_path = await temp_provider.save(path, content)
    assert saved_path == path
    assert await temp_provider.exists(path) is True

@pytest.mark.asyncio
async def test_save_duplicate(temp_provider):
    content = b"test"
    path = "duplicate.txt"
    await temp_provider.save(path, content)
    with pytest.raises(FileExistsError):
        await temp_provider.save(path, content)

@pytest.mark.asyncio
async def test_delete(temp_provider):
    path = "delete.txt"
    await temp_provider.save(path, b"test")
    await temp_provider.delete(path)
    assert await temp_provider.exists(path) is False

@pytest.mark.asyncio
async def test_open(temp_provider):
    path = "stream.txt"
    await temp_provider.save(path, b"hello")
    chunks = []
    async for chunk in temp_provider.open(path):
        chunks.append(chunk)
    assert b"".join(chunks) == b"hello"
